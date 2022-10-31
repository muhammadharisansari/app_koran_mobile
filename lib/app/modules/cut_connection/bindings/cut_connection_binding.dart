import 'package:get/get.dart';

import '../controllers/cut_connection_controller.dart';

class CutConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CutConnectionController>(
      () => CutConnectionController(),
    );
  }
}
