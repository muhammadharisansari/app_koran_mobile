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
  RxBool reload = false.obs;
  RxInt sum = 0.obs;
  RxString awal = ''.obs;
  RxString akhir = ''.obs;

  void resetPIN() {
    box.remove('pin');
    Get.offAllNamed(Routes.CREATE_PIN);
  }

  Future<Iterable<Setoran>> getWhereSetoran() async {
    sum.value = 0;
    final data = await setoranProv.getAllSetoran();
    String today = DateFormat('y-M-dd').format(DateTime.now());

    Iterable<Setoran> hasil =
        data.where((element) => element.tanggal!.contains('$today'));
    hasil.forEach((element) => sum += int.parse(element.jumlah!));

    if (reload.isTrue) {
      reload.value = false;
      sum.value = 0;
    }
    return hasil;
  }

  Future<List<Koran>> getAllKoran() async {
    if (reload.isTrue) {
      reload.value = false;
    }
    return await setoranProv.getAllKoran();
  }

  Future<void> logout() async {
    box.remove('pin');
    box.remove('name');
    box.remove('picture');
    box.remove('email');
    _googleSignIn.signOut();
    _googleSignIn.disconnect();
    Get.offAllNamed(Routes.LOGIN);
  }
}
