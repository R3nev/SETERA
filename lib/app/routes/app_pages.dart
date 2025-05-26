import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart' as home_view;
import '../modules/klasifikasi_poin/views/klasifikasi_view.dart';
import '../modules/login/bindings/login_binding.dart' as login_binding;
import '../modules/login/views/login_view.dart';
import '../modules/more/bindings/more_binding.dart' as more_binding;
import '../modules/more/views/more_view.dart';
import '../modules/notif/bindings/notif_binding.dart';
import '../modules/notif/views/notif_view.dart';
import '../modules/poin_pelanggaran/bindings/poin_pelanggaran_binding.dart';
import '../modules/poin_pelanggaran/views/poin_pelanggaran_view.dart';
import '../modules/poin_plus/bindings/poin_plus_binding.dart';
import '../modules/poin_plus/views/poin_plus_view.dart';
import '../modules/poin_tambahana/bindings/poin_tambahana_binding.dart';
import '../modules/poin_tambahana/views/poin_tambahana_view.dart';
import '../modules/profile/bindings/profile_binding.dart' as profile_binding;
import '../modules/profile/views/profile_view.dart' as profile_view;
import '../modules/profile_edit/views/profile_edit_view.dart';
import '../modules/register/bindings/register_binding.dart' as register_binding;
import '../modules/register/views/register_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../widgets/splash.dart';

import '../modules/klasifikasi_poin/bindings/klasifikasi_binding.dart'
    as Klasifikasi_Binding;

import '../modules/profile_edit/bindings/profile_edit_binding.dart'
    as profile_edit_binding;

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
      page: () => home_view.HomeView(),
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
      page: () => const profile_view.ProfileScreen(),
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
    GetPage(
      name: _Paths.NOTIF,
      page: () => NotificationPage(),
      binding: NotifBinding(),
    ),
    GetPage(
      name: _Paths.POIN_PELANGGARAN,
      page: () => const PoinPelanggaranView(),
      binding: PoinPelanggaranBinding(),
    ),
    GetPage(
      name: _Paths.POIN_TAMBAHANA,
      page: () => const PointsScreen(),
      binding: PoinTambahanaBinding(),
    ),
    GetPage(
      name: _Paths.POIN_PLUS,
      page: () => PoinTambahanPage(),
      binding: PoinPlusBinding(),
    ),
    GetPage(
      name: _Paths.klasifikasi,
      page: () => const KlasifikasiPoinPage(),
      binding: Klasifikasi_Binding.KlasifikasiBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
