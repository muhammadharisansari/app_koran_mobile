import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/tambah_mitra_koran_controller.dart';

class TambahMitraKoranView extends GetView<TambahMitraKoranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 55, 52, 245),
              // Colors.purpleAccent,
              Colors.lightBlueAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        title: Text('Tambah Mitra Koran'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.LIST_KORAN),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              controller: controller.koranNameC,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nama mitra",
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.addMitraKoran(),
              child: Text('Tambahkan'),
            ),
          ],
        ),
      ),
    );
  }
}
