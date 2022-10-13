import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/koran_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/edit_mitra_koran_controller.dart';

class EditMitraKoranView extends GetView<EditMitraKoranController> {
  Koran set = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.koranC.text = set.koran!;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.blue,
              // Colors.greenAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        title: Text('Edit Mitra Koran'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.LIST_KORAN),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Hapus data',
                    content: Text(
                        'Yakin ingin menghapus data : ${set.koran}?'),
                    onConfirm: () => controller.deleteMitraKoran(set.idKoran!),
                    onCancel: () => Get.back(),
                    confirmTextColor: Colors.green,
                    buttonColor: Colors.white,
                    textConfirm: 'Yakin',
                    cancelTextColor: Colors.red,
                    textCancel: 'Batal');
              }, icon: Icon(Icons.delete_forever_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              controller: controller.koranC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nama mitra",
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.updateMitraKoran(set.idKoran!),
              child: Text('Perbarui'),
            ),
          ],
        ),
      ),
    );
  }
}
