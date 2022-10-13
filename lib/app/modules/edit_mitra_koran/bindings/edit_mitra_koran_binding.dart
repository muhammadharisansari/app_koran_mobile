import 'package:get/get.dart';

import '../controllers/edit_mitra_koran_controller.dart';

class EditMitraKoranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditMitraKoranController>(
      () => EditMitraKoranController(),
    );
  }
}
