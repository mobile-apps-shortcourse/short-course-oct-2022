part of '../setup.basic.info.dart';

class _AvatarPage extends StatefulWidget {
  final CrowderUser? user;

  const _AvatarPage({Key? key, this.user}) : super(key: key);

  @override
  State<_AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<_AvatarPage> {
  File? _selectedPhoto;
  late final _onboardingCubit = context.read<OnboardingCubit>();

  @override
  void initState() {
    super.initState();
    doAfterDelay(() {
      if (!_onboardingCubit.kAvatar.isNullOrEmpty()) {
        setState(() => _selectedPhoto = File(_onboardingCubit.kAvatar!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedColumn(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        'Help us identify you on the platform with a nice selfie 😉'
            .h6(context, alignment: TextAlign.center)
            .bottom(24),

        /// avatar
        Container(
          height: 160,
          width: 160,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            shape: BoxShape.circle,
            border: Border.all(color: context.theme.disabledColor),
          ),
          child: _selectedPhoto == null
              ? Icon(Entypo.picture,
                  size: 48, color: context.theme.disabledColor)
              : Image.file(_selectedPhoto!, fit: BoxFit.cover),
        ),

        ///
        AppRoundedButton(
          text: 'Use Gallery',
          onTap: () => _processImage(ImageSource.gallery),
          icon: FontAwesome5.images,
        ).top(40),
        AppRoundedButton(
          text: 'Open Camera',
          onTap: () => _processImage(ImageSource.camera),
          outlined: true,
          icon: FeatherIcons.camera,
        ).top(12),
      ],
    );
  }

  /// pick image from [ImageSource.gallery] or [ImageSource.camera]
  Future<void> _processImage(ImageSource source) async {
    try {
      var imagePicker = ImagePicker();
      var xFile = await imagePicker.pickImage(source: source);
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
          setState(() {
            _selectedPhoto = File(croppedFile.path);
            _onboardingCubit.kAvatar = croppedFile.path;
          });
        }
      }
    } catch (e) {
      logger.e(e);
      context.showCustomDialog(
          headerIconAsset: kAppLogo,
          message: 'Oops...we are unable to use this feature');
    }
  }
}
