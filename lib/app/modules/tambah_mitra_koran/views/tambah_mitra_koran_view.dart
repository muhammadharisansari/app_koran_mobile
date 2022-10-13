import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tambah_mitra_koran_controller.dart';

class TambahMitraKoranView extends GetView<TambahMitraKoranController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TambahMitraKoranView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TambahMitraKoranView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
