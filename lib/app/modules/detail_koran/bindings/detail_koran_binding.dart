import 'package:get/get.dart';

import '../controllers/detail_koran_controller.dart';

class DetailKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKoranController>(
      () => DetailKoranController(),
    );
  }
}
