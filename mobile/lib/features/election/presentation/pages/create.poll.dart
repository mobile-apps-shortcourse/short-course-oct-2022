import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/app/route.gr.dart';
import 'package:mobile/features/shared/presentation/manager/poll_cubit.dart';
import 'package:mobile/features/shared/presentation/widgets/app.bar.dart';
import 'package:mobile/protos/voting.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:mobile/utils/imagery.dart';
import 'package:mobile/utils/validator.dart';
import 'package:protobuf_google/protobuf_google.dart';
import 'package:shared_utils/shared_utils.dart';

/// create a new poll
class CreatePollPage extends StatefulWidget {
  const CreatePollPage({Key? key}) : super(key: key);

  @override
  State<CreatePollPage> createState() => _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> {
  var _loading = false, _categories = List<PollCategory>.empty();
  final _pollCubit = PollCubit(),
      _deleteCategoryCubit = PollCubit(),
      _formKey = GlobalKey<FormState>(),
      _nameController = TextEditingController(),
      _titleController = TextEditingController(),
      _descController = TextEditingController();
  File? _bannerImage;
  DateTime? _startTimestamp, _endTimestamp;
  Poll? _currentPoll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CrowderAppBar(
        title: 'Create a poll',
        contentPadding: _currentPoll == null
            ? EdgeInsets.zero
            : const EdgeInsets.fromLTRB(24, 36, 24, 0),
        showCurrentUser: true,
        child: BlocListener(
          bloc: _pollCubit,
          listener: (context, state) {
            if (!mounted) return;

            setState(() => _loading = state is LoadingState);

            if (state is ErrorState<String>) {
              context.showCustomDialog(
                  headerIconAsset: kAppLogo, message: state.failure);
            }

            if (state is SuccessState<Poll>) {
              _bannerImage = null;
              setState(() => _currentPoll = state.data);
              _pollCubit.getCategoriesForPoll(poll: state.data.id);
            }

            if (state is SuccessState<PollCategory>) {
              _nameController.clear();
              _currentPoll?.categories.add(state.data.id);
              setState(() => _bannerImage = null);
              _deleteCategoryCubit.updatePoll(poll: _currentPoll!);
            }

            if (state is SuccessState<List<PollCategory>>) {
              setState(() => _categories = state.data);
            }
          },
          child: LoadingIndicator(
            lottieAnimResource: kLoadingAnimUrl,
            isLoading: _loading,
            child: _currentPoll == null
                ? AnimatedListView(
                    children: [
                      /// banner image
                      GestureDetector(
                        onTap: _pickAndCropImage,
                        child: Container(
                          height: context.height * 0.25,
                          width: context.width,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary
                                .withOpacity(kEmphasisLow),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: _bannerImage == null
                              ? AnimatedColumn(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: _pickAndCropImage,
                                      color: context.colorScheme.primary,
                                      icon: const Icon(FontAwesome.file_image,
                                          size: 48),
                                    ),
                                    'Tap to select a banner image for this poll'
                                        .caption(
                                      context,
                                      color: context.colorScheme.primary,
                                      alignment: TextAlign.center,
                                    ),
                                  ],
                                ).centered()
                              : Image.file(_bannerImage!, fit: BoxFit.cover),
                        ),
                      ),
                      'Complete the details for this poll to get started'
                          .subtitle1(context,
                              weight: FontWeight.bold,
                              alignment: TextAlign.center,
                              color: context.colorScheme.primary)
                          .top(20)
                          .horizontal(24),

                      /// form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppTextField(
                              'Title',
                              controller: _titleController,
                              enabled: !_loading,
                              capitalization: TextCapitalization.words,
                              validator: Validators.validate,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextField(
                                    'Start Date',
                                    readOnly: true,
                                    enabled: !_loading,
                                    controller: TextEditingController(
                                      text: _startTimestamp == null
                                          ? null
                                          : _startTimestamp!.format('D, M j'),
                                    ),
                                    onTap: () async {
                                      var now = DateTime.now();
                                      var time = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        lastDate: DateTime(now.year, 12, 31),
                                        useRootNavigator: true,
                                        firstDate: DateTime.now(),
                                      );
                                      setState(() => _startTimestamp = time);
                                    },
                                  ).right(8),
                                ),
                                Expanded(
                                  child: AppTextField(
                                    'End Date',
                                    readOnly: true,
                                    enabled: !_loading,
                                    controller: TextEditingController(
                                      text: _endTimestamp == null
                                          ? null
                                          : _endTimestamp!.format('D, M j'),
                                    ),
                                    onTap: () async {
                                      var now = DateTime.now();
                                      var time = await showDatePicker(
                                        context: context,
                                        initialDate: now,
                                        lastDate: DateTime(now.year, 12, 31),
                                        useRootNavigator: true,
                                        firstDate: DateTime.now(),
                                      );
                                      setState(() => _endTimestamp = time);
                                    },
                                  ).left(8),
                                ),
                              ],
                            ),
                            AppTextField(
                              'Short description',
                              controller: _descController,
                              enabled: !_loading,
                              maxLines: 3,
                              validator: Validators.validate,
                            ),
                          ],
                        ),
                      ).top(24).horizontal(24),
                      AppRoundedButton(
                        text: 'Save & continue',
                        enabled: !_loading,
                        onTap: _validateAndSave,
                      ).centered(),
                    ],
                  )
                : AnimatedListView(
                    animateType: AnimateType.slideUp,
                    children: [
                      'Create categories for this poll to finish your setup'
                          .subtitle1(context,
                              weight: FontWeight.bold,
                              alignment: TextAlign.center,
                              color: context.colorScheme.primary),

                      /// banner image
                      GestureDetector(
                        onTap: _pickAndCropImage,
                        child: Container(
                          height: context.height * 0.25,
                          width: context.width,
                          margin: const EdgeInsets.only(top: 16),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary
                                .withOpacity(kEmphasisLow),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(24),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                          child: _bannerImage == null
                              ? AnimatedColumn(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: _pickAndCropImage,
                                      color: context.colorScheme.primary,
                                      icon: const Icon(FontAwesome.file_image,
                                          size: 48),
                                    ),
                                    'Tap to select a banner image for this category'
                                        .caption(
                                      context,
                                      color: context.colorScheme.primary,
                                      alignment: TextAlign.center,
                                    ),
                                  ],
                                ).centered()
                              : Image.file(_bannerImage!, fit: BoxFit.cover),
                        ),
                      ),

                      /// form
                      Form(
                        key: _formKey,
                        child: AppTextField(
                          'Name',
                          controller: _nameController,
                          capitalization: TextCapitalization.words,
                          validator: Validators.validate,
                          enabled: !_loading,
                        ),
                      ).top(24),

                      /// actions
                      Row(
                        children: [
                          Expanded(
                            child: AppRoundedButton(
                              text: 'Finish',
                              enabled: !_loading,
                              onTap: () => context.router.pushAndPopUntil(
                                  const DashboardRoute(),
                                  predicate: (_) => false),
                              outlined: true,
                            ).right(8),
                          ),
                          Expanded(
                            child: AppRoundedButton(
                              text: 'Add Category',
                              enabled: !_loading,
                              onTap: _validateAndSaveCategory,
                            ).left(8),
                          ),
                        ],
                      ).top(40),

                      _categories.isEmpty
                          ? const EmptyContentPlaceholder(
                              title: 'No categories available',
                              subtitle: 'Add new categories to get started',
                              icon: FontAwesome5.box_open,
                            ).top(context.height * 0.1)
                          : Column(
                              children: [
                                'Categories'
                                    .h6(context,
                                        weight: FontWeight.bold,
                                        color: context.colorScheme.primary)
                                    .top(40)
                                    .align(Alignment.centerLeft),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => ListTile(
                                    title: Text(_categories[index].name),
                                    subtitle:
                                        const Text('Tap to add candidates'),
                                    // todo => add candidates
                                    onTap: () => context.showCustomDialog(
                                        headerIconAsset: kAppLogo,
                                        message: kFeatureUnderDev),
                                    leading: _categories[index]
                                        .bannerImage
                                        .avatar(size: 40),
                                    trailing: IconButton(
                                      onPressed: () {
                                        _deleteCategoryCubit.deleteCategory(
                                            _categories[index].id);
                                      },
                                      color: context.colorScheme.error,
                                      icon: BlocBuilder(
                                        bloc: _deleteCategoryCubit,
                                        builder: (context, state) {
                                          if (state is LoadingState) {
                                            return SizedBox(
                                              height: 24,
                                              width: 24,
                                              child:
                                                  const CircularProgressIndicator
                                                          .adaptive()
                                                      .centered(),
                                            );
                                          }

                                          return const Icon(FeatherIcons.trash);
                                        },
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 12),
                                  itemCount: _categories.length,
                                ),
                              ],
                            ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  /// pick and crop image from gallery
  void _pickAndCropImage() async {
    try {
      var picker = ImagePicker();
      var xFile = await picker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        /// crop image
        var croppedFile = await ImageCropper().cropImage(
          sourcePath: xFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: kAppName,
                toolbarColor: context.colorScheme.secondary,
                toolbarWidgetColor: context.colorScheme.onSecondary,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: kAppName,
            ),
          ],
        );
        if (croppedFile != null) {
          setState(() => _bannerImage = File(croppedFile.path));
        }
      }
    } catch (e) {
      logger.e(e);
      context.showCustomDialog(
          headerIconAsset: kAppLogo, message: kImageProcessingErrorMessage);
    }
  }

  void _validateAndSave() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      var title = _titleController.text.trim(),
          desc = _descController.text.trim();

      if (_bannerImage == null) {
        context.showCustomDialog(
            headerIconAsset: kAppLogo,
            message: 'Please provide a banner image for this poll');
        return;
      }

      if (_startTimestamp == null || _endTimestamp == null) {
        context.showCustomDialog(
            headerIconAsset: kAppLogo,
            message: 'Provide a start & end timestamp for this poll');
        return;
      }

      logger.i('creating new poll $title & desc => $desc');
      var poll = Poll(
        title: title,
        description: desc,
        bannerImage: base64Encode(
            await (await Imagery.compressFile(_bannerImage!)).readAsBytes()),
        startTimestamp: Timestamp.fromDateTime(_startTimestamp!),
        endTimestamp: Timestamp.fromDateTime(_endTimestamp!),
        status: PollStatus.pending,
      );
      _pollCubit.createPoll(poll);
    }
  }

  void _validateAndSaveCategory() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      if (_bannerImage == null) {
        context.showCustomDialog(
            headerIconAsset: kAppLogo,
            message: 'Please provide a banner image for this category');
        return;
      }

      var category = PollCategory(
        poll: _currentPoll!.id,
        bannerImage: base64Encode(
            await (await Imagery.compressFile(_bannerImage!)).readAsBytes()),
        name: _nameController.text.trim(),
      );
      _pollCubit.createCategory(category);
    }
  }
}
