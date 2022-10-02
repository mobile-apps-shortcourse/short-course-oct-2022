import 'package:flutter/material.dart';
import 'package:mobile/features/shared/presentation/widgets/app.bar.dart';
import 'package:mobile/protos/auth.pb.dart';
import 'package:mobile/utils/constants.dart';
import 'package:shared_utils/shared_utils.dart';

/// select user account type
class UserTypePickerPage extends StatefulWidget {
  const UserTypePickerPage({Key? key}) : super(key: key);

  @override
  State<UserTypePickerPage> createState() => _UserTypePickerPageState();
}

class _UserTypePickerPageState extends State<UserTypePickerPage> {
  UserType? _selectedUserType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        top: false,
        child: AppRoundedButton(
          text: 'Next',
          enabled: _selectedUserType != null,
          onTap: () => context.showCustomDialog(
              headerIconAsset: kAppLogo, message: kFeatureUnderDev),
        ).horizontal(24),
      ),
      body: CrowderAppBar(
        title: 'Select an account',
        showBackButton: true,
        child: Container(

        ),
      ),
    );
  }
}
