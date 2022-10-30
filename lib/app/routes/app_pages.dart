import 'package:get/get.dart';

import 'package:app_koran/app/modules/create_pin/bindings/create_pin_binding.dart';
import 'package:app_koran/app/modules/create_pin/views/create_pin_view.dart';
import 'package:app_koran/app/modules/detail_koran/bindings/detail_koran_binding.dart';
import 'package:app_koran/app/modules/detail_koran/views/detail_koran_view.dart';
import 'package:app_koran/app/modules/edit_koran/bindings/edit_koran_binding.dart';
import 'package:app_koran/app/modules/edit_koran/views/edit_koran_view.dart';
import 'package:app_koran/app/modules/edit_mitra_koran/bindings/edit_mitra_koran_binding.dart';
import 'package:app_koran/app/modules/edit_mitra_koran/views/edit_mitra_koran_view.dart';
import 'package:app_koran/app/modules/home/bindings/home_binding.dart';
import 'package:app_koran/app/modules/home/views/home_view.dart';
import 'package:app_koran/app/modules/input_pin/bindings/input_pin_binding.dart';
import 'package:app_koran/app/modules/input_pin/views/input_pin_view.dart';
import 'package:app_koran/app/modules/list_koran_masuk/bindings/list_koran_masuk_binding.dart';
import 'package:app_koran/app/modules/list_koran_masuk/views/list_koran_masuk_view.dart';
import 'package:app_koran/app/modules/login/bindings/login_binding.dart';
import 'package:app_koran/app/modules/login/views/login_view.dart';
import 'package:app_koran/app/modules/mode_verify/bindings/mode_verify_binding.dart';
import 'package:app_koran/app/modules/mode_verify/views/mode_verify_view.dart';
import 'package:app_koran/app/modules/tambah_koran/bindings/tambah_koran_binding.dart';
import 'package:app_koran/app/modules/tambah_koran/views/tambah_koran_view.dart';

import '../modules/list_koran/bindings/list_koran_binding.dart';
import '../modules/list_koran/views/list_koran_view.dart';
import '../modules/tambah_mitra_koran/bindings/tambah_mitra_koran_binding.dart';
import '../modules/tambah_mitra_koran/views/tambah_mitra_koran_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_KORAN,
      page: () => TambahKoranView(),
      binding: TambahKoranBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KORAN,
      page: () => EditKoranView(),
      binding: EditKoranBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KORAN,
      page: () => DetailKoranView(),
      binding: DetailKoranBinding(),
    ),
    GetPage(
      name: _Paths.LIST_KORAN,
      page: () => ListKoranView(),
      binding: ListKoranBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MITRA_KORAN,
      page: () => EditMitraKoranView(),
      binding: EditMitraKoranBinding(),
    ),
    GetPage(
      name: _Paths.TAMBAH_MITRA_KORAN,
      page: () => TambahMitraKoranView(),
      binding: TambahMitraKoranBinding(),
    ),
    GetPage(
      name: _Paths.LIST_KORAN_MASUK,
      page: () => ListKoranMasukView(),
      binding: ListKoranMasukBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PIN,
      page: () => CreatePinView(),
      binding: CreatePinBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_PIN,
      page: () => InputPinView(),
      binding: InputPinBinding(),
    ),
    GetPage(
      name: _Paths.MODE_VERIFY,
      page: () => ModeVerifyView(),
      binding: ModeVerifyBinding(),
    ),
  ];
}
