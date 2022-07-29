import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/login.dart';
import '../screens/welcome.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth authentication = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  void _moveToPage(User? user) {
    Get.offAll(() => user == null ? const LoginPage() : const WelcomePage());
  }

  void register({
    required String email,
    required String password,
    required Function(String errorMessage) onFailure,
  }) async {
    try {
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } on Exception catch (e) {
      onFailure(e.toString());
    }
  }

  void logout() => authentication.signOut();
}
