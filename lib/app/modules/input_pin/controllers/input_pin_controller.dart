import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class InputPinController extends GetxController {
  TextEditingController pinC = TextEditingController();
  final box = GetStorage();

  void cekPin() {
    if (pinC.value.toString() == box.read('pin')) {
      print(box.read('pin'));
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.snackbar(
        'KESALAHAN',
        'PIN tidak sama, Coba lagi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    }
  }
}
