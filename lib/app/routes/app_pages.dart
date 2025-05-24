import 'package:get/get.dart';
import '../widgets/splash.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/bindings/login_binding.dart' as login_binding;
import '../modules/register/views/register_view.dart';
import '../modules/register/bindings/register_binding.dart' as login_binding;
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/bindings/profile_binding.dart' as login_binding;

part '../routes/app_routes.dart';
class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: login_binding.LoginBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: login_binding.RegisterBinding(),
    ),
    GetPage(
      name: '/profile',
      page: () => const ProfileScreen(),
      binding: login_binding.ProfileBinding(), // ganti dengan nama widget halaman profile kamu
    )
  ];
}