import 'package:app_koran/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  UserCredential? userCredential;
  var isAuth = false.obs;

  final box = GetStorage();

  Future<void> firstInitialized() async {
    try {
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        isAuth.value = true;
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

        Get.offAllNamed(Routes.HOME);
      } else {
        print('TIDAK BERHASIL LOGIN');
      }
    } catch (error) {
      print(error);
    }
  }
}
