import 'package:get/get.dart';
import 'package:skibidiskibidisigma/app/modules/Cari/views/cari_view.dart';
import 'package:skibidiskibidisigma/app/modules/Plan/views/plan_view.dart';
import 'package:skibidiskibidisigma/app/modules/Profile/bindings/profile_binding.dart';
import 'package:skibidiskibidisigma/app/modules/Profile/views/profile_view.dart';
import 'package:skibidiskibidisigma/app/modules/Ulasan/views/ulasan_view.dart';
import 'package:skibidiskibidisigma/app/modules/akun/views/akun_view.dart';
import 'package:skibidiskibidisigma/app/modules/authentication/bindings/authentication_binding.dart';
import 'package:skibidiskibidisigma/app/modules/authentication/views/authentication_view.dart';
import 'package:skibidiskibidisigma/app/modules/navbar/bindings/navbar_binding.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        NavbarBinding(), // Tambahkan binding lain di sini
  ],
),   

  GetPage(
      name: _Paths.CARI,
      page: () => CariView(),
      bindings: [
        HomeBinding(),
        NavbarBinding(), // Tambahkan binding lain di sini
    ],
  ),
 GetPage(
      name: _Paths.PLAN,
      page: () => const PlanView(),
      bindings: [
        HomeBinding(),
        NavbarBinding(), // Tambahkan binding lain di sini
  ],
),
  GetPage(
      name: _Paths.ULASAN,
      page: () => UlasanView(),
      bindings: [
        HomeBinding(),
        NavbarBinding(), // Tambahkan binding lain di sini
  ],
),
  GetPage(
      name: _Paths.AKUN,
      page: () => AkunView(),
      bindings: [
        HomeBinding(),
        NavbarBinding(), // Tambahkan binding lain di sini
  ],
),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
