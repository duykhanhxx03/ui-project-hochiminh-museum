import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/login/login_screen.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ui_project_hochiminh_museum/navigation_menu.dart';
import 'package:ui_project_hochiminh_museum/repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Var
  final _auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(
            const OnBoardingScreen(),
          )
        : Get.offAll(
            const NavigationMenu(),
          );
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('-----------------');
      print(firebaseUser.value);
      print('-----------------');
      firebaseUser.value != null
          ? Get.offAll(const NavigationMenu())
          : Get.offAll(const LoginScreen());
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebaseUser.value != null
          ? Get.offAll(const NavigationMenu())
          : Get.offAll(const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
