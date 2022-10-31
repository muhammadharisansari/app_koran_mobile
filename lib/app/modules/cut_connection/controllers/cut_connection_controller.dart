import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';

class CutConnectionController extends GetxController {
  LoginController loginC = Get.put(LoginController(), permanent: true);
  void refreshMode() {
    loginC.firstInitialized();
  }
}
