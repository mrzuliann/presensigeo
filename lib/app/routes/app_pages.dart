import 'package:get/get.dart';

import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/LaporanPresensi/bindings/laporan_presensi_binding.dart';
import '../modules/LaporanPresensi/views/laporan_presensi_view.dart';
import '../modules/MainMenu/bindings/main_menu_binding.dart';
import '../modules/MainMenu/views/main_menu_view.dart';
import '../modules/Pengumuman/bindings/pengumuman_binding.dart';
import '../modules/Pengumuman/views/pengumuman_view.dart';
import '../modules/Presensi_In/bindings/presensi_in_binding.dart';
import '../modules/Presensi_In/views/presensi_in_view.dart';
import '../modules/Presensi_Out/bindings/presensi_out_binding.dart';
import '../modules/Presensi_Out/views/presensi_out_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MAIN_MENU,
      page: () => const MainMenuView(),
      binding: MainMenuBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSI_IN,
      page: () => const PresensiInView(),
      binding: PresensiInBinding(),
    ),
    GetPage(
      name: _Paths.PRESENSI_OUT,
      page: () => const PresensiOutView(),
      binding: PresensiOutBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN,
      page: () => const PengumumanView(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PRESENSI,
      page: () => const LaporanPresensiView(),
      binding: LaporanPresensiBinding(),
    ),
  ];
}
