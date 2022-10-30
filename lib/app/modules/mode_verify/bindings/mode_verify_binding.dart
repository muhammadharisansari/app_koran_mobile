import 'package:get/get.dart';

import '../controllers/mode_verify_controller.dart';

class ModeVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModeVerifyController>(
      () => ModeVerifyController(),
    );
  }
}
