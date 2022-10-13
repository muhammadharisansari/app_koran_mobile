import 'package:get/get.dart';

import '../controllers/edit_koran_controller.dart';

class EditKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditKoranController>(
      () => EditKoranController(),
    );
  }
}
