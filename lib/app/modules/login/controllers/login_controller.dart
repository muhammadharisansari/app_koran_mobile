import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/models/userf_model.dart';
import '../../../data/providers/urlMaster.dart';
import '../../../data/providers/setoran_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  SetoranProvider setProv = SetoranProvider();
  UserCredential? userCredential;
  var isAuth = false.obs;
  var isverify = false.obs;

  final box = GetStorage();
  BaseURL baseurl = BaseURL();

  Future<void> firstInitialized() async {
    try {
      GoogleSignInAccount? _currentUser = await _googleSignIn.signIn();
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        isAuth.value = true;
      }
      String emaiil = _currentUser!.email;
      //get verify dari restful
      print('emaiil: $emaiil');
      if (emaiil != null) {
        Future<List<Userf>> coba = userByEmail(emaiil);
        coba.then((value) => value.forEach((element) {
              element.verify != 'Y' || element.verify == null
                  ? isverify.value = false
                  : isverify.value = true;
              print('firstInitialized() : ${isverify.value}');
              if (isverify.isTrue) {
                Get.offAllNamed(Routes.CREATE_PIN);
              } else {
                Get.offAllNamed(Routes.MODE_VERIFY);
              }
            }));
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? _currentUser = await _googleSignIn.signIn();

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        //kondisi login berhasil
        print('--currentUser--');
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print('--userCredential--');
        print(userCredential);

        Map<String, dynamic>? Name =
            userCredential!.additionalUserInfo!.profile;

        box.write('name', '${Name!['name']}');
        box.write('picture', '${Name['picture']}');
        box.write('email', '${Name['email']}');
        baseurl.addUser(Name['email']);

//get verify dari restful
        Future<List<Userf>> coba = userByEmail(_currentUser.email);
        coba.then((value) => value.forEach((element) {
              element.verify != 'Y' || element.verify == null
                  ? isverify.value = false
                  : isverify.value = true;
              print('login() : ${isverify.value}');
              if (isverify.isTrue) {
                Get.offAllNamed(Routes.CREATE_PIN);
              } else if (isverify.isFalse) {
                Get.offAllNamed(Routes.MODE_VERIFY);
              } else {
                Get.offAllNamed(Routes.LOGIN);
              }
            }));
      } else {
        print('TIDAK BERHASIL LOGIN');
      }
    } catch (error) {
      print(error);
    }
  }

  Future<List<Userf>> userByEmail(email) async {
    return await setProv.getUser(email);
  }
}
