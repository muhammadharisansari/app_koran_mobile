import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/errConnect.dart';
import '../../../data/models/setoran_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/list_koran_masuk_controller.dart';

class ListKoranMasukView extends GetView<ListKoranMasukController> {
  @override
  Future<void> reload() async {
    controller.reload.value = true;
  }

  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
            onPressed: () => Get.offAllNamed(Routes.HOME),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text('List Koran Masuk'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.utc(2000),
                  lastDate: DateTime.now(),
                ).then((value) {
                  if (value != null) {
                    return controller.filterTanggal.value = value.toString();
                  }
                });
              },
              icon: Icon(Icons.filter_alt),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => reload(),
          child: FutureBuilder<List<Setoran>>(
            future: controller.reload.isTrue
                ? controller.getAllSetoran()
                : controller.getAllSetoran(),
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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: 150,
                          width: Get.width - (Get.width / 6),
                          color: Colors.blue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text(
                                    (controller.filterTanggal.value != '')
                                        ? '${DateFormat('dd MMMM y').format(DateTime.parse(controller.filterTanggal.value))}'
                                        : '${controller.last.value}   s/d   ${controller.first.value}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              SizedBox(height: 4),
                              Divider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${snapshot.data!.length}',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Transaksi',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 30),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${controller.sum.value}',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'PCS',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        Setoran setoran = snapshot.data![index];
                        return ListTile(
                          onTap: () => Get.offNamed(
                            Routes.DETAIL_KORAN,
                            arguments: setoran,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.lightBlue[100],
                            child: Text('${index + 1}'),
                          ),
                          title:
                              Text("${setoran.namaKoran} (${setoran.jumlah})"),
                          subtitle: Text(
                              "${DateFormat('dd-MM-y').format(DateTime.parse(setoran.tanggal!))}"),
                          trailing: Text("${setoran.bulan}"),
                        );
                      }),
                    )),
                  ],
                );
              }
            },
          ),
        ),
        floatingActionButton: (controller.filterTanggal.value == '')
            ? FloatingActionButton(
                onPressed: () => Get.toNamed(Routes.TAMBAH_KORAN),
                tooltip: "Tambah data",
                child: Icon(Icons.add))
            : CircleAvatar(
                backgroundColor: Colors.red,
                child: IconButton(
                  onPressed: () {
                    controller.filterTanggal.value = '';
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
