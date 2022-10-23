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

  Future<List<Setoran>> getAllSetoran() async {
    sum.value = 0;
    List<Setoran> hasil = await setProv.getAllSetoran();

    first.value = DateFormat().add_yMMMd().format(
          DateTime.parse(hasil.first.tanggal!),
        );
    last.value = DateFormat().add_yMMMd().format(
          DateTime.parse(hasil.last.tanggal!),
        );
    hasil.forEach((element) => sum += int.parse(element.jumlah!));

    if (reload.isTrue) {
      reload.value = false;
      sum.value = 0;
    }

    return await setProv.getAllSetoran();
  }
}
