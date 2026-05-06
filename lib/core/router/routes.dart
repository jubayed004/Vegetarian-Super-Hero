import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vegetarian_super_hero/core/router/route_path.dart';
import 'package:vegetarian_super_hero/features/auth/view/active_otp_screen.dart';
import 'package:vegetarian_super_hero/features/auth/view/auth_selection_screen.dart';
import 'package:vegetarian_super_hero/features/auth/view/forget_password.dart';
import 'package:vegetarian_super_hero/features/auth/view/login_screen.dart';
import 'package:vegetarian_super_hero/features/auth/view/reset_password_screen.dart';
import 'package:vegetarian_super_hero/features/auth/view/sign_up_screen.dart';
import 'package:vegetarian_super_hero/features/input_info/view/input_info_screen.dart';
import 'package:vegetarian_super_hero/features/onboarding/view/onboarding_screen.dart';
import 'package:vegetarian_super_hero/features/splash/view/splash_screen.dart';
import 'package:vegetarian_super_hero/utils/extension/base_extension.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter initRoute = GoRouter(
    initialLocation: RoutePath.splashScreen.addBasePath,
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    routes: [
      ///======================= Initial Route =======================
      GoRoute(
        name: RoutePath.splashScreen,
        path: RoutePath.splashScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SplashScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.onboardingScreen,
        path: RoutePath.onboardingScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const OnboardingScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.authSelectionScreen,
        path: RoutePath.authSelectionScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const AuthSelectionScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.inputInfoScreen,
        path: RoutePath.inputInfoScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const InputInfoScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.signUpScreen,
        path: RoutePath.signUpScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const SignUpScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.loginScreen,
        path: RoutePath.loginScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const LoginScreen(),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.activeOtpScreen,
        path: RoutePath.activeOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final email = map['email'] as String?;
          return _buildPageWithAnimation(
            child: ActiveOtpScreen(email: email ?? ""),
            state: state,
          );
        },
      ),
      GoRoute(
        name: RoutePath.forgetPasswordScreen,
        path: RoutePath.forgetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          return _buildPageWithAnimation(
            child: const ForgetPassword(),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.forgetOtpScreen,
        path: RoutePath.forgetOtpScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final email = extra as String?;
          return _buildPageWithAnimation(
            child: ActiveOtpScreen(email: email ?? ""),
            state: state,
          );
        },
      ),

      GoRoute(
        name: RoutePath.resetPasswordScreen,
        path: RoutePath.resetPasswordScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final email = map['email'] as String?;
          final otp = map['otp'] as String?;
          return _buildPageWithAnimation(
            child: ResetPasswordScreen(email: email ?? "", otp: otp ?? ""),
            state: state,
          );
        },
      ),
      //
      // GoRoute(
      //   name: RoutePath.welcomeBackScreen,
      //   path: RoutePath.welcomeBackScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const WelcomeBackScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.homeScreen,
      //   path: RoutePath.homeScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const HomeScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.quickSearchScreen,
      //   path: RoutePath.quickSearchScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const QuickSearchScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.resultScreen,
      //   path: RoutePath.resultScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     final extra = state.extra;
      //     final map = (extra is Map<String, dynamic>) ? extra : {};
      //
      //     final latitude = map['latitude'] as double?;
      //     final longitude = map['longitude'] as double?;
      //
      //     return _buildPageWithAnimation(
      //       child: ResultScreen(latitude: latitude, longitude: longitude),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.resultSummaryScreen,
      //   path: RoutePath.resultSummaryScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ResultSummaryScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.saveScreen,
      //   path: RoutePath.saveScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const SaveScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.profileScreen,
      //   path: RoutePath.profileScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ProfileScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.editProfileScreen,
      //   path: RoutePath.editProfileScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const EditProfileScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.settingScreen,
      //   path: RoutePath.settingScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const SettingScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.changePasswordScreen,
      //   path: RoutePath.changePasswordScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ChangePasswordScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.contactSupportScreen,
      //   path: RoutePath.contactSupportScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ContactAndSupportScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.termsAndConditionScreen,
      //   path: RoutePath.termsAndConditionScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const TermsAndConditionScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.privacyPolicyScreen,
      //   path: RoutePath.privacyPolicyScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const PrivacyPolicyScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.referenceScreen,
      //   path: RoutePath.referenceScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     return _buildPageWithAnimation(
      //       child: const ReferenceScreen(),
      //       state: state,
      //     );
      //   },
      // ),
      // GoRoute(
      //   name: RoutePath.saveDetailsScreen,
      //   path: RoutePath.saveDetailsScreen.addBasePath,
      //   pageBuilder: (context, state) {
      //     final extra = state.extra;
      //     final id = extra as String? ?? "";
      //     return _buildPageWithAnimation(
      //       child: SaveDetailsScreen(id: id),
      //       state: state,
      //     );
      //   },
      // ),
      /*GoRoute(
        name: RoutePath.categoryEventsScreen,
        path: RoutePath.categoryEventsScreen.addBasePath,
        pageBuilder: (context, state) {
          final extra = state.extra;
          final map = (extra is Map<String, dynamic>) ? extra : {};

          final id = map['id'] as String? ?? '';
          final title = map['title'] as String? ?? '';

          return _buildPageWithAnimation(
            child: CategoryEventsScreen(id: id, title: title),
            state: state,
          );
        },
      ),*/
    ],
  );

  static CustomTransitionPage _buildPageWithAnimation({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  static GoRouter get route => initRoute;
}
