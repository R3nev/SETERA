import 'package:get/get.dart';
import '../widgets/splash.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/bindings/login_binding.dart' as login_binding;
import '../modules/register/views/register_view.dart';
import '../modules/register/bindings/register_binding.dart' as register_binding;
import '../modules/profile/views/profile_view.dart';
import '../modules/profile/bindings/profile_binding.dart' as profile_binding;
import '../modules/profile_edit/views/profile_edit_view.dart';
import '../modules/profile_edit/bindings/profile_edit_binding.dart' as profile_edit_binding;
import '../modules/more/views/more_view.dart';
import '../modules/more/bindings/more_binding.dart' as more_binding;

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
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
      binding: register_binding.RegisterBinding(),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => const ProfileScreen(),
      binding: profile_binding.ProfileBinding(),
    ),
    GetPage(
      name: _Paths.profile_edit,
      page: () => ProfileEditScreen(initialProfile: const {
        'nama': 'Sylus',
        'kelas': 'XII IPS A',
        'password': 'Admin123',
        'absen': '27',
      }),
      binding: profile_edit_binding.ProfileEditBinding(),
    ),
    GetPage(
      name: _Paths.more,
      page: () => const ReadingPage(),
      binding: more_binding.MoreBinding(),
    ),
  ];
}