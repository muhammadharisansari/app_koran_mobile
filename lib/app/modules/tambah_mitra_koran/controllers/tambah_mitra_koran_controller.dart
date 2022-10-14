import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/urlMaster.dart';
import '../../../routes/app_pages.dart';

class TambahMitraKoranController extends GetxController {
  BaseURL baseurl = BaseURL();

  TextEditingController koranNameC = TextEditingController();

  void addMitraKoran() async {
    if (koranNameC.text == '') {
      Get.snackbar(
        'KESALAHAN',
        'Form harus diisi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    } else {
      baseurl.addMitraKoran(koranNameC.text);
      Get.snackbar(
        'BERHASIL',
        'Mitra koran berhasil ditambahkan',
        colorText: Colors.green,
        backgroundColor: Colors.white,
      );
      Get.offAllNamed(Routes.LIST_KORAN);
    }
  }
}
