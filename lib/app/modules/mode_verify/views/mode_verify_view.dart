import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../login/controllers/login_controller.dart';
import '../controllers/mode_verify_controller.dart';

class ModeVerifyView extends GetView<ModeVerifyController> {
  LoginController loginC = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROSES PEMERIKSAAN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                width: 300,
                height: 270,
                color: Color.fromARGB(255, 255, 245, 214),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Icon(Icons.timer,
                        size: 90, color: Color.fromARGB(255, 255, 156, 7)),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 174, 0),
                                fontSize: 18),
                            text:
                                'Akun anda sedang diperiksa oleh admin. Silahkan hubungi admin atau klik tombol refresh jika akun anda sudah diverifikasi.'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                controller.refreshMode();
              },
              child: Text('REFRESH'),
            ),
          ],
        ),
      ),
    );
  }
}
