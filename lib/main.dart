import 'package:app_koran/widgets/errorPage.dart';
import 'package:app_koran/widgets/loading_page.dart';
import 'package:app_koran/widgets/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  LoginController loginC = Get.put(LoginController(), permanent: true);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return errorPage();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GetMaterialApp(
                  localizationsDelegates: [
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    MonthYearPickerLocalizations.delegate,
                  ],
                  debugShowCheckedModeBanner: false,
                  title: "Data Koran",
                  initialRoute: loginC.isAuth.isFalse
                      ? Routes.LOGIN
                      : loginC.isverify.isFalse
                          ? Routes.MODE_VERIFY
                          : box.read('pin') == null
                              ? Routes.CREATE_PIN
                              : Routes.INPUT_PIN,
                  getPages: AppPages.routes,
                );
              }
              return FutureBuilder(
                future: loginC.firstInitialized(),
                builder: (context, snapshot) => splashScreen(),
              );
            },
          );
        }

        return loading_page();
      },
    );
  }
}
