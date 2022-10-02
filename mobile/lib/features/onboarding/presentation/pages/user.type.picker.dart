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
        contentBackground: context.colorScheme.surface,
        child: CustomScrollView(
          slivers: [
            /// icon
            SliverToBoxAdapter(
              child: kAppLogo
                  .asAssetImage(size: 120, fit: BoxFit.cover)
                  .centered(),
            ),

            /// header
            SliverToBoxAdapter(
              child:
                  'In order to get started with $kAppName, we need to know your personality'
                      .subtitle1(context,
                          alignment: TextAlign.center, emphasis: kEmphasisHigh),
            ),

            /// types
            SliverPadding(
              padding: const EdgeInsets.only(top: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  UserType.values
                      .map((e) => _UserAccountTypeTile(
                            type: e,
                            onTap: (type) =>
                                setState(() => _selectedUserType = type),
                            selectedUserType: _selectedUserType,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// user type selector
class _UserAccountTypeTile extends StatelessWidget {
  final UserType type;
  final UserType? selectedUserType;
  final void Function(UserType) onTap;
  final _userTypeToIcon = <UserType, IconData>{
    UserType.voter: Icons.how_to_vote,
    UserType.candidate: Icons.account_circle_outlined,
    UserType.organizer: Icons.supervised_user_circle,
  };
  final _userTypeToDesc = <UserType, String>{
    UserType.voter: 'Vote for your favorite contestants',
    UserType.candidate: 'Become a candidate of a contest',
    UserType.organizer: 'Create & manage your contests',
  };

  _UserAccountTypeTile({
    Key? key,
    required this.type,
    required this.onTap,
    required this.selectedUserType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: (selectedUserType == type
              ? context.colorScheme.secondary
              : context.colorScheme.surface),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: selectedUserType == type
                  ? context.colorScheme.secondary
                  : context.theme.disabledColor,
              width: 1.5),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: type.name.capitalize().subtitle1(context,
              color: selectedUserType == type
                  ? context.colorScheme.onSecondary
                  : context.colorScheme.onSurface,
              weight: FontWeight.w600),
          subtitle: _userTypeToDesc.values
              .toList()[_userTypeToDesc.keys
                  .firstWhere((element) => element == type)
                  .value]
              .subtitle2(context,
                  color: selectedUserType == type
                      ? context.colorScheme.onSecondary
                      : context.colorScheme.onSurface),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: selectedUserType == type
                  ? context.colorScheme.onSecondary
                  : context.theme.disabledColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _userTypeToIcon.values.toList()[_userTypeToIcon.keys
                  .firstWhere((element) => element == type)
                  .value],
              color: selectedUserType == type
                  ? context.colorScheme.secondary
                  : context.theme.disabledColor,
            ),
          ),
          onTap: () => onTap(type),
        ),
      );
}
