import 'package:get/get.dart';
import 'package:lmsadminpanle/views/forgotPass/forgot_password_screen.dart';
import 'package:lmsadminpanle/views/login/login_screen.dart';
import 'package:lmsadminpanle/views/register/register_screen.dart';
import 'package:lmsadminpanle/views/root/root_view.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => LoginScreen(), transition: Transition.zoom),
    GetPage(
        name: '/root',
        page: () => RootView(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: '/forgotPass',
        page: () => ForgotPasswordScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: '/register',
        page: () => RegisterScreen(),
        transition: Transition.zoom),
  ];
}
