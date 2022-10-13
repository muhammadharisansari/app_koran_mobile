import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_koran_masuk_controller.dart';

class ListKoranMasukView extends GetView<ListKoranMasukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListKoranMasukView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ListKoranMasukView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
