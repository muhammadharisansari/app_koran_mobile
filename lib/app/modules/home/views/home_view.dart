import 'dart:async';

import 'package:app_koran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/errConnect.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Future<void> refreshPage() async {
    Get.offAllNamed(Routes.HOME);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: refreshPage,
        child: FutureBuilder<List<Setoran>>(
          future: controller.getAllSetoran(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null) {
              print('${snapshot.error}');
              return errConnect();
            }
            if (snapshot.data?.length == 0) {
              return const Center(child: Text('Tidak ada data.'));
            } else {
              return ListView(
                children: [
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: Get.width,
                            height: 170,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 55, 52, 245),
                                    // Colors.purpleAccent,
                                    Colors.lightBlueAccent,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 16, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'MITRA KORAN',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Kelola data koran mitra kantor',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 100,
                                        child: Image.asset(
                                          "assets/icon/icon_app.png",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 60, right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nama Koran',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Get.toNamed(Routes.LIST_KORAN),
                                  child: Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: Get.width,
                            height: 110,
                            child: FutureBuilder<List<Koran>>(
                                future: controller.getAllKoran(),
                                builder: (context, snap) {
                                  if (snap.connectionState ==
                                      ConnectionState.waiting) {
                                    return Row(
                                      children: [
                                        Card(
                                          child: Container(
                                            color: Colors.white,
                                            width: 140,
                                            child: Center(
                                                child: Text(
                                              '...',
                                            )),
                                          ),
                                        ),
                                        Card(
                                          child: Container(
                                            color: Colors.white,
                                            width: 140,
                                            child: Center(
                                                child: Text(
                                              '...',
                                            )),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  if (snap.data?.length == 0) {
                                    return const Center(
                                        child: Text('Tidak ada data.'));
                                  } else {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: (snapshot.data!.length <= 4)
                                          ? snapshot.data!.length
                                          : 4,
                                      itemBuilder: (context, index) {
                                        Koran koran = snap.data![index];
                                        return Card(
                                          child: Container(
                                            color: Color.fromARGB(
                                                255, 211, 250, 253),
                                            width: 140,
                                            child: Center(
                                                child: Text(
                                              '${koran.koran}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            )),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daftar Koran Masuk',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Get.toNamed(Routes.LIST_KORAN_MASUK),
                                  child: Text(
                                    'Lihat Semua',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 250,
                            child: Card(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: (snapshot.data!.length <= 3)
                                    ? snapshot.data!.length
                                    : 3,
                                itemBuilder: (context, index) {
                                  Setoran setoran = snapshot.data![index];
                                  return ListTile(
                                    onTap: () => Get.offAllNamed(
                                      Routes.DETAIL_KORAN,
                                      arguments: setoran,
                                    ),
                                    leading: CircleAvatar(
                                      // backgroundColor: Colors.white,
                                      child: Text(
                                        "${setoran.jumlah}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    title: Text('${setoran.namaKoran}'),
                                    subtitle: Text('${setoran.tanggal}'),
                                    trailing: Text('${setoran.bulan}'),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: Get.width / 20,
                        right: Get.width / 20,
                        top: 135,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 70,
                            width: 300,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton.icon(
                                      onPressed: () =>
                                          Get.toNamed(Routes.TAMBAH_KORAN),
                                      icon: Icon(
                                        Icons.add,
                                      ),
                                      label: Text(
                                        'Koran Masuk',
                                      ),
                                    ),
                                  ),
                                  VerticalDivider(thickness: 2),
                                  Expanded(
                                    child: TextButton.icon(
                                        onPressed: () => Get.toNamed(
                                            Routes.TAMBAH_MITRA_KORAN),
                                        icon: Icon(Icons.add),
                                        label: Text('Mitra Koran')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
