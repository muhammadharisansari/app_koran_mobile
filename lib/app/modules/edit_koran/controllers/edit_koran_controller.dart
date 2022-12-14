import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import '../../../data/providers/urlMaster.dart';
import '../../../routes/app_pages.dart';

class EditKoranController extends GetxController {
  SetoranProvider setProv = SetoranProvider();
  RxString nameOfKoran = ''.obs;
  TextEditingController jumlahC = TextEditingController();
  TextEditingController tanggal = TextEditingController();


  BaseURL baseurl = BaseURL();

  Future<Setoran?> koranByID(int id) async {
    return await setProv.getKoran(id);
  }

  void updateKoran(id) async {
    Setoran set = Get.arguments;

    if (nameOfKoran.value == '' ||
        tanggal.text == '' ||
        jumlahC.text == '') {
      Get.snackbar(
        'KESALAHAN',
        'Semua form harus diisi.',
        colorText: Colors.red,
        backgroundColor: Colors.white,
      );
    } else {
      baseurl.upKoran(id, nameOfKoran.value, tanggal.text, jumlahC.text);

      Get.snackbar(
        'BERHASIL',
        'Data koran berhasil diubah.',
        colorText: Colors.green,
        backgroundColor: Colors.white,
      );
      Get.offNamed(
        Routes.DETAIL_KORAN,
        arguments: set,
      );
    }
  }
}
