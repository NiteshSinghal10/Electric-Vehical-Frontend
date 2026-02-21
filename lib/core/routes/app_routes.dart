import 'package:get/get.dart';

import '../../src/auth/presentation/controllers/login_controller.dart';
import '../../src/auth/presentation/controllers/otp_verification_controller.dart';
import '../../src/auth/presentation/controllers/signup_controller.dart';
import '../../src/auth/presentation/pages/login.dart';
import '../../src/auth/presentation/pages/otp_verification.dart';
import '../../src/auth/presentation/pages/signup.dart';
import '../../src/splash/presentation/controllers/splash_controller.dart';
import '../../src/splash/presentation/pages/splash.dart';
import 'route_names.dart';

///register app routes here
class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder<void>(() {
        Get.put<SplashController>(SplashController());
      }),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder<void>(() {
        Get.lazyPut<LoginController>(LoginController.new);
      }),
    ),
    GetPage(
      name: RouteNames.signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder<void>(() {
        Get.lazyPut<SignupController>(SignupController.new);
      }),
    ),
    GetPage(
      name: RouteNames.otpVerification,
      page: () => const OtpVerificationScreen(),
      binding: BindingsBuilder<void>(() {
        Get.lazyPut<OtpVerificationController>(OtpVerificationController.new);
      }),
    ),
  ];
}
