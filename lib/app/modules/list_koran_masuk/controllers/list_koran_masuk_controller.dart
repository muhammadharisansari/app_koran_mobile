import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';

class ListKoranMasukController extends GetxController {
  SetoranProvider setProv = SetoranProvider();
  RxInt sum = 0.obs;
  RxBool reload = false.obs;
  RxString first = ''.obs;
  RxString last = ''.obs;
  RxString filterTanggal = ''.obs;

  Future<List<Setoran>> getAllSetoran() async {
    sum.value = 0;
    List<Setoran> hasil = await setProv.getAllSetoran();
    if (reload.isTrue) {
      reload.value = false;
      sum.value = 0;
    }
    if (filterTanggal != '') {
      String rubah =
          DateFormat('y-MM-dd').format(DateTime.parse(filterTanggal.value));

      Iterable<Setoran> hitungF =
          hasil.where((element) => element.tanggal!.contains(rubah));
      List<Setoran> iniList = hitungF.toList();

      hitungF.forEach((element) => sum += int.parse(element.jumlah!));

      return iniList;
    } else {
      hasil.forEach((element) => sum += int.parse(element.jumlah!));

      first.value = DateFormat('dd MMMM y').format(
        DateTime.parse(hasil.first.tanggal!),
      );

      last.value = DateFormat('dd MMMM y').format(
        DateTime.parse(hasil.last.tanggal!),
      );

      return await setProv.getAllSetoran();
    }
  }
}
