import 'package:app_koran/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  SetoranProvider setoranProv = SetoranProvider();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final box = GetStorage();

  Future<Iterable<Setoran>> getWhereSetoran() async {
    final data = await setoranProv.getAllSetoran();
    String tahun = DateFormat().add_y().format(DateTime.now());
    String bulan = DateFormat().add_M().format(DateTime.now());
    String tanggal = DateFormat().add_d().format(DateTime.now());

    var hasil = data.where(
        (element) => element.tanggal!.contains('${tahun}-${bulan}-${tanggal}'));
    return hasil;
  }

  Future<List<Koran>> getAllKoran() async {
    return await setoranProv.getAllKoran();
  }

  Future<void> logout() async {
    box.remove('name');
    box.remove('picture');
    box.remove('email');
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed(Routes.LOGIN);
  }
}
