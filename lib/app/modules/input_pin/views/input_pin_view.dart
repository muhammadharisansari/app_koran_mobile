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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 55, 52, 245),
              // Colors.purpleAccent,
              Colors.lightBlueAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
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
                autofocus: true,
                maxLength: 6,
                obscureText: true,
                obscuringCharacter: '*',
                autocorrect: false,
                style: TextStyle(
                  fontSize: 39,
                  letterSpacing: 31,
                ),
                controller: controller.pinC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.cekPin();
                  },
                  child: Text('MASUK'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
