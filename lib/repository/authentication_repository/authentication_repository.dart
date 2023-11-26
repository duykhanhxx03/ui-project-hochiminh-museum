import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/login/login_screen.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/screens/signup/verify_email.dart';
import 'package:ui_project_hochiminh_museum/navigation_menu.dart';
import 'package:ui_project_hochiminh_museum/repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  //Var
  final _auth = FirebaseAuth.instance;

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();

    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);
    // ever(firebaseUser, _setInitialScreen);
  }

  void setInitialScreen(User? user) {
    deviceStorage.writeIfNull('isFirstTime', true);

    user == null
        ? (
            deviceStorage.read('isFirstTime') != true
                ? Get.offAll(() => const LoginScreen())
                : Get.offAll(
                    () => const OnBoardingScreen(),
                  ),
          )
        : (
            user.emailVerified
                ? Get.offAll(
                    () => const NavigationMenu(),
                  )
                : Get.to(
                    () => VerifyEmailScreen(),
                  ),
          );
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setInitialScreen(_auth.currentUser);
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.fromCode(e.code);
      throw ex.message;
    } catch (err) {
      const ex = SignUpWithEmailAndPasswordFailure();
      throw ex.message;
    }
  }

  Future<bool> isDuplicateEmail() async {
    return false;
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setInitialScreen(_auth.currentUser);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.fromCode(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      }
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION: -${ex.message}');
      }
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setInitialScreen(_auth.currentUser);
  }
}
