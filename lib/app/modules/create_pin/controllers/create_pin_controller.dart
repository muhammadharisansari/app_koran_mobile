import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class CreatePinController extends GetxController {
  TextEditingController pinC = TextEditingController();

  final box = GetStorage();
  void create() {
    if (pinC.value != null) {
      // box.remove('pin');
      box.write('pin', pinC.value.toString());
      Get.offAllNamed(Routes.INPUT_PIN);
    } else {
      Get.snackbar(
        'KESALAHAN',
        'Semua form harus diisi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }
}
