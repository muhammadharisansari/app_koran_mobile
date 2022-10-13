import 'package:get/get.dart';

import '../controllers/tambah_mitra_koran_controller.dart';

class TambahMitraKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahMitraKoranController>(
      () => TambahMitraKoranController(),
    );
  }
}
