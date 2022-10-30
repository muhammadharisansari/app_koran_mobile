import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';

class ModeVerifyController extends GetxController {
  LoginController loginC = Get.put(LoginController(), permanent: true);
  final box = GetStorage();
  void refreshMode() {
    loginC.firstInitialized();
  }
}
