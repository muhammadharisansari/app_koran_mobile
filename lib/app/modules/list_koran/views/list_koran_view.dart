import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../widgets/errConnect.dart';
import '../../../data/models/koran_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/list_koran_controller.dart';
import '../../../data/providers/setoran_provider.dart';

class ListKoranView extends GetView<ListKoranController> {
  @override
  SetoranProvider setProv = SetoranProvider();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 55, 52, 245),
              Colors.lightBlueAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.offNamed(Routes.HOME),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Daftar Mitra Koran'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: FutureBuilder<List<Koran>>(
            future: controller.getAllKoran(),
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
                          height: 100,
                          width: Get.width - (Get.width / 4),
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${snapshot.data!.length}',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'mitra',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Colors.white,
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(Routes.TAMBAH_MITRA_KORAN);
                                },
                                icon: Icon(Icons.add_box_sharp,
                                    color: Colors.white),
                                iconSize: 60,
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
                        Koran koran = snapshot.data![index];
                        return ListTile(
                            onTap: () => Get.offNamed(
                                  Routes.EDIT_MITRA_KORAN,
                                  arguments: koran,
                                ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.lightBlue[100],
                              child: Text('${index + 1} '),
                            ),
                            title: Text("${koran.koran}"),
                            trailing: Icon(Icons.arrow_forward_ios));
                      }),
                    )),
                  ],
                );
              }
            }),
      ),
    );
  }
}
