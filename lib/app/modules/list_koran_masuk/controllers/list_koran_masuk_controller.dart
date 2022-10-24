import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../../../data/providers/setoran_provider.dart';

class ListKoranMasukController extends GetxController {
  SetoranProvider setProv = SetoranProvider();
  RxInt sum = 0.obs;
  RxInt sumKoran = 0.obs;
  RxBool reload = false.obs;
  RxString first = ''.obs;
  RxString last = ''.obs;
  RxString filterBulan = ''.obs;
  RxList koranname = [].obs;
  RxList korantot = [].obs;

  Future<List<Setoran>> getAllSetoran() async {
    sum.value = 0;
    List<Setoran> hasil = await setProv.getAllSetoran();

    if (reload.isTrue) {
      reload.value = false;
      sum.value = 0;
    }
    if (filterBulan != '') {
      String rubah =
          DateFormat('y-MM').format(DateTime.parse(filterBulan.value));

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

  Future<List<String>> totalKoran() async {
    List<Setoran> hasil = await setProv.getAllSetoran();
    List<Koran> koran = await setProv.getAllKoran();

    koran.forEach((element) => koranname.add(element.koran!));

    List<String> korantot = [];

    for (var i = 0; i < koran.length; i++) {
      sumKoran.value = 0;

      if (filterBulan.value != '') {
        String rubah =
            DateFormat('y-MM').format(DateTime.parse(filterBulan.value));
        Iterable<Setoran> hitungK = hasil.where((element) =>
            element.namaKoran!.contains(koranname[i]) &&
            element.tanggal!.contains(rubah));
        hitungK.forEach(
          (element) => sumKoran += int.parse(element.jumlah!),
        );
      } else {
        Iterable<Setoran> hitungK =
            hasil.where((element) => element.namaKoran!.contains(koranname[i]));
        hitungK.forEach(
          (element) => sumKoran += int.parse(element.jumlah!),
        );
      }

      korantot.add(sumKoran.value.toString());
      print('${koranname[i]} : ${sumKoran}');
    }

    return korantot;
  }
}
