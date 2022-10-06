/// app info
const kAppName = 'Crowder';
const kAppLogo = 'assets/vote.logo.webp';
const kAppDesc =
    'An e-voting mobile application created with Flutter and backed by Golang (using gRPC framework)';

/// app animation urls
const kLoadingAnimUrl =
    'https://assets10.lottiefiles.com/packages/lf20_MtN0BG.json';

/// other
const kFeatureUnderDev = 'The requested feature is under development';

/// shared prefs
class PrefUtils {
  static const kUserIdKey = 'user.id';
  static const kUserTokenKey = 'user.token';
  static const kUserTypeKey = 'user.type';
}

/// error/ info messages
class MessageUtils {
  static const kUnauthenticatedIssueMessage =
      "You're not signed in. Please sign in and try again";
  static const kConnectionIssueMessage =
      'Oops...we have trouble reaching our servers. Please try again later';
}
