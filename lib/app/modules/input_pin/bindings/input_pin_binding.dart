import 'package:get/get.dart';

import '../controllers/input_pin_controller.dart';

class InputPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputPinController>(
      () => InputPinController(),
    );
  }
}
