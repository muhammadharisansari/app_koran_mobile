import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import '../../../data/providers/urlMaster.dart';
import '../../../routes/app_pages.dart';

class DetailKoranController extends GetxController {
  SetoranProvider setProv = SetoranProvider();
  BaseURL baseurl = BaseURL();

  Future<Setoran?> koranByID(id) async {
    return await setProv.getKoran(id);
  }

  void deleteKoran(id) {
    baseurl.delKoran(id);

    Get.snackbar(
      'BERHASIL',
      'Data koran berhasil dihapus.',
      colorText: Colors.green,
      backgroundColor: Colors.white,
    );
    Get.offAllNamed(Routes.HOME);
  }
}
