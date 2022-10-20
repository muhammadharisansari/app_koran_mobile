import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 500,
              child: LottieBuilder.network(
                  'https://assets1.lottiefiles.com/packages/lf20_gjmecwii.json'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                controller.login();
              },
              icon: Icon(
                Icons.login,
                color: Colors.blue,
              ),
              label: Text(
                'Sign In With Google',
                style: TextStyle(color: Colors.blue),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 228, 242, 255)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
