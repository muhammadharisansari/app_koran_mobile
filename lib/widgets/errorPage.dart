import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';

class errorPage extends StatelessWidget {
  const errorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_sharp,
              color: Colors.red,
              size: 80,
            ),
            const Center(
                child:
                    Text('Sedang terjadi kesalahan, silahkan coba lagi nanti')),
          ],
        ),
      ),
    );
  }
}
