import 'package:app_koran/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';

class HomeController extends GetxController {
  SetoranProvider setoranProv = SetoranProvider();

  Future<List<Setoran>> getAllSetoran() async {
    return await setoranProv.getAllSetoran();
  }

  Future<List<Koran>> getAllKoran() async {
    return await setoranProv.getAllKoran();
  }
}
