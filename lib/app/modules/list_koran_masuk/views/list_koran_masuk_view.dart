import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/errConnect.dart';
import '../../../data/models/setoran_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/list_koran_masuk_controller.dart';

class ListKoranMasukView extends GetView<ListKoranMasukController> {
  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.HOME),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text('List Koran Masuk'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Setoran>>(
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
                      color: Colors.deepPurple[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${snapshot.data!.length}',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Setoran',
                                style: TextStyle(
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.purple,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.TAMBAH_KORAN);
                            },
                            icon:
                                Icon(Icons.add_box_sharp, color: Colors.purple),
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
                    Setoran setoran = snapshot.data![index];
                    return ListTile(
                      onTap: () => Get.offAllNamed(
                        Routes.DETAIL_KORAN,
                        arguments: setoran,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue[100],
                        child: Text('${setoran.jumlah} '),
                      ),
                      title: Text("${setoran.namaKoran}"),
                      subtitle: Text("${setoran.tanggal}"),
                      trailing: Text("${setoran.bulan}"),
                    );
                  }),
                )),
              ],
            );
          }
        },
      ),
    );
  }
}
