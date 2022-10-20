import 'package:app_koran/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  SetoranProvider setoranProv = SetoranProvider();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final box = GetStorage();

  Future<List<Setoran>> getAllSetoran() async {
    return await setoranProv.getAllSetoran();
  }

  Future<List<Koran>> getAllKoran() async {
    return await setoranProv.getAllKoran();
  }

  Future<void> logout() async {
    box.remove('name');
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed(Routes.LOGIN);
  }
}
