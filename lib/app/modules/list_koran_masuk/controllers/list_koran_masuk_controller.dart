import 'package:get/get.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';

class ListKoranMasukController extends GetxController {
  SetoranProvider setProv = SetoranProvider();

  RxBool reload = false.obs;

  Future<List<Setoran>> getAllSetoran() async {
    if (reload.isTrue) {
      reload.value = false;
      return await setProv.getAllSetoran();
    }

    return await setProv.getAllSetoran();
  }
}
