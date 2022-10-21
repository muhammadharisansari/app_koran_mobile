import 'package:get/get.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import '../../../routes/app_pages.dart';

class ListKoranController extends GetxController {
  SetoranProvider setProv = SetoranProvider();
  RxBool reload = false.obs;

  Future<void> refresh() async {
    // reload.isTrue;
    Get.offAllNamed(Routes.LIST_KORAN);
  }

  Future<List<Koran>> getAllKoran() async {
    if (reload.isTrue) {
      reload.value = false;
      return await setProv.getAllKoran();
    }
    return await setProv.getAllKoran();
  }
}
