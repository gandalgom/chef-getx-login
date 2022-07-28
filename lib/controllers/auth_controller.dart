import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:get_x_login/screens/login.dart';
import 'package:get_x_login/screens/welcome.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = authentication.currentUser as Rx<User?>;
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  dynamic _moveToPage(User? user) {
    Get.offAll(() => user == null ? const LoginPage() : const WelcomePage());
  }

  void register(String email, String password, Function()? onFailure) async {
    try {
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } on Exception {
      onFailure;
    }
  }
}
