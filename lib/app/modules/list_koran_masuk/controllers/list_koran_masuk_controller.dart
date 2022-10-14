import 'package:get/get.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';

class ListKoranMasukController extends GetxController {
  SetoranProvider setProv = SetoranProvider();

  Future<List<Setoran>> getAllSetoran() async {
    return await setProv.getAllSetoran();
  }
}
