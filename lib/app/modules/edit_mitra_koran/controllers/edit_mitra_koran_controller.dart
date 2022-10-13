import 'package:app_koran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/urlMaster.dart';

class EditMitraKoranController extends GetxController {
  TextEditingController koranC = TextEditingController();
  BaseURL baseurl = BaseURL();

  void updateMitraKoran(id) async {
    if (koranC.text == '') {
      Get.snackbar(
        'KESALAHAN',
        'Form harus diisi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    } else {
      baseurl.upMitraKoran(id, koranC.text);

      // Get.offAllNamed(Routes.HOME);
      Get.snackbar(
        'BERHASIL',
        'Data koran berhasil diubah.',
        colorText: Colors.green,
        backgroundColor: Colors.white,
      );
      Get.offNamed(Routes.LIST_KORAN);
    }
  }

  void deleteMitraKoran(id) {
    baseurl.delMitraKoran(id);

    Get.snackbar(
      'BERHASIL',
      'Data koran berhasil dihapus.',
      colorText: Colors.green,
      backgroundColor: Colors.white,
    );
    Get.offAllNamed(Routes.LIST_KORAN);
  }
}
