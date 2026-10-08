import 'package:finance_app/core/navigation/app_routes.dart';
import 'package:finance_app/my_pages/authentification/Register.dart';
import 'package:finance_app/my_pages/authentification/create_new_password.dart';
import 'package:finance_app/my_pages/authentification/forget_password.dart';
import 'package:finance_app/my_pages/authentification/login.dart';
import 'package:finance_app/my_pages/authentification/on_boarding.dart';
import 'package:finance_app/my_pages/authentification/otp_verfication.dart';
import 'package:finance_app/my_pages/authentification/password_change.dart';
import 'package:finance_app/my_pages/main-screens/main_screen.dart';
import 'package:go_router/go_router.dart';

class RouterGenerator {
  static GoRouter Routes = GoRouter(
    routes: [
      GoRoute(
        name: AppRoute.forgetpassword,
        path: AppRoute.forgetpassword,
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(
        name: AppRoute.onboarding,
        path: AppRoute.onboarding,
        builder: (context, state) => OnBoarding(),
      ),
      GoRoute(
        name: AppRoute.login,
        path: AppRoute.login,
        builder: (context, state) => Login(),
      ),
      GoRoute(
        name: AppRoute.register,
        path: AppRoute.register,
        builder: (context, state) => Register(),
      ),
      GoRoute(
        name: AppRoute.createnewpassword,
        path: AppRoute.createnewpassword,
        builder: (context, state) => CreateNewPassword(),
      ),
      GoRoute(
        name: AppRoute.passwordchange,
        path: AppRoute.passwordchange,
        builder: (context, state) => PasswordChange(),
      ),
      GoRoute(
        name: AppRoute.otpverification,
        path: AppRoute.otpverification,
        builder: (context, state) => OtpVerification(),
      ),
      GoRoute(
        name: AppRoute.mainscreen,
        path: AppRoute.mainscreen,
        builder: (context, state) => MainScreen(),
      ),
    ],
    initialLocation: AppRoute.onboarding,
  );
}
