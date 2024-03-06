import 'package:flutter/material.dart';

import 'ui/screens/auth/login_flow/login_screen.dart';
import 'ui/screens/auth/login_flow/recover_account.dart';
import 'ui/screens/auth/login_flow/reset_link_sent.dart';
import 'ui/screens/auth/login_flow/reset_password.dart';
import 'ui/screens/auth/sign_up_flow/almost_done.dart';
import 'ui/screens/auth/sign_up_flow/personal_details.dart';
import 'ui/screens/auth/sign_up_flow/signup_screen.dart';
import 'ui/screens/auth/sign_up_flow/welcome_msg.dart';
import 'ui/screens/blank_screen.dart';
import 'ui/screens/initial/onboarding_screen.dart';
import 'ui/screens/initial/splash_screen.dart';
import 'ui/screens/initial/welcome_screen.dart';
import 'ui/screens/user_tabs/user_tab.dart';

class RouteGenerator {
  static const String blankScreen = '/blank_screen';
  static const String splashScreen = '/';
  static const String onBoarding = '/onboarding_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String loginScreen = 'login_screen';
  static const String recoverAccount = '/recover_account';
  static const String resetLink = '/reset_link_sent';
  static const String resetPassword = '/reset_password';
  static const String signUpScreen = '/signup_screen';
  static const String addUserInfo = '/personal_details';
  static const String almostDone = '/almost_done';
  static const String welcomeMessage = '/welcome_msg';
  static const String userTabs = '/user_tabs';

  RouteGenerator._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case blankScreen:
        return MaterialPageRoute(builder: (_) => const BlankScreen());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const UserSignInScreen());
      case recoverAccount:
        return MaterialPageRoute(builder: (_) => const RecoverAccountScreen());
      case resetLink:
        return MaterialPageRoute(builder: (_) => const ResetLinkScreen());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const UserSignUpScreen());
      case addUserInfo:
        return MaterialPageRoute(builder: (_) => const UserPersonalInfo());
      case almostDone:
        return MaterialPageRoute(builder: (_) => const SignUpAlmostDone());
      case welcomeMessage:
        return MaterialPageRoute(builder: (_) => const WelcomeMessage());
      case userTabs:
        return MaterialPageRoute(builder: (_) => const UserTabs());
      default:
        throw const RouteException('Route not found');
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
