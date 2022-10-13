import 'package:get/get.dart';

import '../controllers/list_koran_masuk_controller.dart';

class ListKoranMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKoranMasukController>(
      () => ListKoranMasukController(),
    );
  }
}
