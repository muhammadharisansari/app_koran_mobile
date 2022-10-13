import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';

class errConnect extends StatelessWidget {
  const errConnect({Key? key}) : super(key: key);

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
          const Center(child: Text('Koneksi server terputus.')),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: Text('refresh'),
          )
        ],
      ),
    );
  }
}