import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/input_pin_controller.dart';

class InputPinView extends GetView<InputPinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INPUT PIN'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Masukkan 6 PIN anda',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextField(
                autocorrect: false,
                style: TextStyle(
                  fontSize: 39,
                  letterSpacing: 25,
                ),
                controller: controller.pinC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  controller.cekPin();
                },
                child: Text('MASUK'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
