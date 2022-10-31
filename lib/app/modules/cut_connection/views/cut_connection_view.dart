import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cut_connection_controller.dart';

class CutConnectionView extends GetView<CutConnectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_sharp,
            color: Colors.red,
            size: 80,
          ),
          const Center(
              child: Text('Terputus dengan server, silahkan coba lagi nanti')),
              SizedBox(height: 30),SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                controller.refreshMode();
              },
              child: Text('REFRESH'),
            ),
        ],
      ),
    );
  }
}
