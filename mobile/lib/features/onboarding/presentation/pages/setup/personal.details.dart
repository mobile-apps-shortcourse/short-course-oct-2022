part of '../setup.basic.info.dart';

class _PersonalDetailsPage extends StatefulWidget {
  final CrowderUser? user;

  const _PersonalDetailsPage({Key? key, this.user}) : super(key: key);

  @override
  State<_PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<_PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  late final _headerText = widget.user == null
          ? 'Provide your profile details to get started'
          : 'Update your profile information',
      _onboardingCubit = context.read<OnboardingCubit>(),
      _usernameController =
          TextEditingController(text: _onboardingCubit.kUsername),
      _nameController =
          TextEditingController(text: _onboardingCubit.kDisplayName),
      _passwordController =
          TextEditingController(text: _onboardingCubit.kPassword),
      _bioController = TextEditingController(text: _onboardingCubit.kBio);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          _headerText.h6(context, alignment: TextAlign.center).bottom(24),
          AppTextField(
            'Display Name',
            controller: _nameController,
            capitalization: TextCapitalization.words,
            validator: Validators.validate,
            onChange: (input) =>
                setState(() => _onboardingCubit.kDisplayName = input?.trim()),
          ),
          AppTextField(
            'Username',
            inputType: TextInputType.emailAddress,
            controller: _usernameController,
            validator: Validators.validateEmail,
            onChange: (input) =>
                setState(() => _onboardingCubit.kUsername = input?.trim()),
          ),
          AppTextField(
            'Password',
            textFieldType: AppTextFieldType.password,
            controller: _passwordController,
            validator: Validators.validatePassword,
            onChange: (input) =>
                setState(() => _onboardingCubit.kPassword = input?.trim()),
          ),
          AppTextField(
            'Bio (Tell us about yourself)',
            controller: _bioController,
            maxLines: 3,
            maxLength: 100,
            capitalization: TextCapitalization.sentences,
            onChange: (input) =>
                setState(() => _onboardingCubit.kBio = input?.trim()),
          ),
        ],
      ),
    );
  }
}
