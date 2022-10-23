import 'dart:async';

import 'package:app_koran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../widgets/errConnect.dart';
import '../../../data/models/koran_model.dart';
import '../../../data/models/setoran_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final box = GetStorage();
  @override
  Future<void> refreshPage() async {
    controller.reload.value = true;
  }

  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.blueAccent[50],
          width: 220,
          child: Container(
            padding: EdgeInsets.only(top: 80, right: 20, left: 20),
            alignment: Alignment.topCenter,
            width: Get.width,
            height: Get.height - 100,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('${box.read('picture')}'),
                  backgroundColor: Colors.grey[350],
                ),
                SizedBox(height: 20),
                Text('${box.read('name')}'),
                SizedBox(height: 10),
                Text('${box.read('email')}'),
                SizedBox(height: 10),
                Divider(
                  thickness: 2,
                ),
                SizedBox(height: 360),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Color.fromARGB(255, 255, 209, 209),
                    ),
                  ),
                  onPressed: () {
                    controller.logout();
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey[50],
        body: RefreshIndicator(
          onRefresh: () => refreshPage(),
          child: FutureBuilder<Iterable<Setoran>>(
            future: controller.reload.isTrue
                ? controller.getWhereSetoran()
                : controller.getWhereSetoran(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.error != null) {
                print('${snapshot.error}');
                return errConnect();
              }
              // if (snapshot.data?.length == 0) {
              //   return const Center(child: Text('Tidak ada data.'));
              // }
              else {
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
                                      Color.fromARGB(255, 20, 16, 248),
                                      // Colors.purpleAccent,
                                      Color.fromARGB(255, 115, 207, 250),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'MITRA KORAN',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 24),
                                            Text(
                                              'Selamat datang, ${box.read('name')}',
                                              // 'Selamat datang, ...',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
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
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              width: Get.width,
                              height: 210,
                              child: FutureBuilder<List<Koran>>(
                                  future: controller.reload.isTrue
                                      ? controller.getAllKoran()
                                      : controller.getAllKoran(),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 60, right: 10, left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Mitra Koran (0)',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () => Get.toNamed(
                                                      Routes.LIST_KORAN),
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
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Card(
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 227, 253, 255),
                                                    width: 140,
                                                    height: 80,
                                                    child: Center(
                                                        child: Text(
                                                      '...',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                                Card(
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 227, 253, 255),
                                                    width: 140,
                                                    height: 80,
                                                    child: Center(
                                                        child: Text(
                                                      '...',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                                Card(
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 227, 253, 255),
                                                    width: 140,
                                                    height: 80,
                                                    child: Center(
                                                        child: Text(
                                                      '...',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    // if (snap.data?.length == 0) {
                                    //   return const Center(
                                    //       child: Text('Tidak ada data.'));
                                    // }
                                    else {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 60, right: 10, left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Mitra Koran (${snap.data!.length})',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () => Get.toNamed(
                                                      Routes.LIST_KORAN),
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
                                            height: 90,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: snap.data!.length,
                                              itemBuilder: (context, index) {
                                                Koran koran = snap.data![index];
                                                return Card(
                                                  child: Container(
                                                    color: Color.fromARGB(
                                                        255, 227, 253, 255),
                                                    width: 140,
                                                    child: Center(
                                                        child: Text(
                                                      '${koran.koran}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue,
                                                      ),
                                                    )),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  }),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              child: Column(
                                children: [
                                  Card(
                                    color: Color.fromARGB(255, 227, 253, 255),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Transaksi hari ini',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          trailing: Text(
                                            '${snapshot.data!.length} transaksi',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Divider(
                                            thickness: 1,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Koran hari ini',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          trailing: Text(
                                            '${controller.sum.value} pcs',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: Get.width,
                                    height: Get.height *
                                            snapshot.data!.length /
                                            10 +
                                        40,
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      // itemCount milik setoran
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        List<Setoran> setoran =
                                            snapshot.data!.toList();
                                        Setoran data = setoran[index];

                                        return Card(
                                          child: ListTile(
                                            onTap: () => Get.toNamed(
                                              Routes.DETAIL_KORAN,
                                              arguments: data,
                                            ),
                                            leading: CircleAvatar(
                                              // backgroundColor: Colors.white,
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                            title: Text(
                                                '${data.namaKoran} (${data.jumlah})'),
                                            subtitle: Text('${data.tanggal}'),
                                            trailing: Text('${data.bulan}'),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
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
      ),
    );
  }
}
