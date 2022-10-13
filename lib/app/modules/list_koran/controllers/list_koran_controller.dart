import 'package:get/get.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import '../../../routes/app_pages.dart';

class ListKoranController extends GetxController {
  SetoranProvider setProv = SetoranProvider();

  Future<void> refresh() async {
    Get.offAllNamed(Routes.LIST_KORAN);
  }

  Future<List<Koran>> getAllKoran() async {
    return await setProv.getAllKoran();
  }
}
