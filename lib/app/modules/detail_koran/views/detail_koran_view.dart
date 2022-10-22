import 'package:app_koran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/setoran_model.dart';
import '../controllers/detail_koran_controller.dart';

class DetailKoranView extends GetView<DetailKoranController> {
  Setoran setoran = Get.arguments;

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
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.LIST_KORAN_MASUK),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Detail Koran'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: 'Hapus data',
                    content: Text(
                        'Yakin ingin menghapus data : ${setoran.namaKoran}?'),
                    onConfirm: () => controller.deleteKoran(setoran.id!),
                    onCancel: () => Get.back(),
                    confirmTextColor: Colors.green,
                    buttonColor: Colors.white,
                    textConfirm: 'Yakin',
                    cancelTextColor: Colors.red,
                    textCancel: 'Batal');
              },
              icon: Icon(Icons.delete_forever),
            ),
          )
        ],
      ),
      body: FutureBuilder<Setoran?>(
        future: controller.koranByID(setoran.id!),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.error != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline_sharp,
                  color: Colors.red,
                  size: 80,
                ),
                const Center(child: Text('Koneksi server terputus.')),
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${snap.data!.namaKoran}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 1, height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ID",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${snap.data!.id}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bulan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${snap.data!.bulan}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tanggal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${DateFormat().add_yMd().format(DateTime.parse(snap.data!.tanggal!))}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Jumlah",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "${snap.data!.jumlah}",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(thickness: 1, height: 15),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(
                        Routes.EDIT_KORAN,
                        arguments: snap.data!,
                      ),
                      child: Text('Edit Data'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
