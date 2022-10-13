import 'package:get/get.dart';

import '../controllers/list_koran_controller.dart';

class ListKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKoranController>(
      () => ListKoranController(),
    );
  }
}
