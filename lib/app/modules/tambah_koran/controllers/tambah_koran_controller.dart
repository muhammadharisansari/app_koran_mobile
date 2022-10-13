import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/urlMaster.dart';

import '../../../routes/app_pages.dart';

class TambahKoranController extends GetxController {
  RxString dataTanggal = ''.obs;
  RxString namakoran = ''.obs;
  TextEditingController jumlahC = TextEditingController();

  BaseURL baseurl = BaseURL();

  void tambahKoran() async {
    if (namakoran.value == '' ||
        dataTanggal.value == '' ||
        jumlahC.text == '') {
      Get.snackbar(
        'KESALAHAN',
        'Semua form harus diisi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    } else {
      baseurl.addKoran(namakoran.value, dataTanggal.value, jumlahC.text);
      Get.snackbar(
        'BERHASIL',
        'Data koran berhasil ditambahkan',
        colorText: Colors.green,
        backgroundColor: Colors.white,
      );
      Get.offAllNamed(Routes.HOME);
    }
  }
}