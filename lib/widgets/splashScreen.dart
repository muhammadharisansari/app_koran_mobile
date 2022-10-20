import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Container(
          width: 100,
          height: 250,
          child: Image.asset(
            "assets/icon/icon_app.png",
          ),
        ),
      )),
    );
  }
}
