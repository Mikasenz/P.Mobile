part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH; // Add SPLASH route
  static const HOME = _Paths.HOME;
  static const AUTHENTICATION = _Paths.AUTHENTICATION;
  static const PROFILE = _Paths.PROFILE;
  static const PLAN = _Paths.PLAN;
  static const CARI = _Paths.CARI;
  static const ULASAN = _Paths.ULASAN;
  static const AKUN = _Paths.AKUN;
}


abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const AUTHENTICATION = '/authentication';
  static const PROFILE = '/profile';
  static const PLAN = '/plan';
  static const CARI = '/search';
  static const ULASAN = '/ulasan';
  static const AKUN = '/akun';
}
