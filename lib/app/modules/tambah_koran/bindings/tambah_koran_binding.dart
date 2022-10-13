import 'package:get/get.dart';

import '../controllers/tambah_koran_controller.dart';

class TambahKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahKoranController>(
      () => TambahKoranController(),
    );
  }
}
