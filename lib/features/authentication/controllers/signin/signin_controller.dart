import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/user_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();
  var controller = Get.put(AuthenticationRepository());
  var userRepo = Get.put(UserRepository());

  var deviceStorage = GetStorage('app-setting-configs');

  var isPasswordObscure = true.obs;
  var isRememberMe = true.obs;

  void showHiddenPassword() {}

  void rememberMe(bool isRememberMe) {}

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    final savedEmail = deviceStorage.read('userEmail');
    email.text = savedEmail;
  }

  Future<void> signIn(String email, String password) async {
    if (isRememberMe.value) {
      await deviceStorage.write('userEmail', email);
    }
    isLoading.value = true;
    await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
    isLoading.value = false;
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithGoogle();
      isGoogleLoading.value = false;

      auth.setInitialScreen(auth.firebaseUser.value);
      final names = auth.firebaseUser.value!.displayName!.split(' ');

      final model = UserModel(
        firstName: names[0],
        lastName: names.sublist(1).join(' '),
        email: auth.firebaseUser.value!.email!,
        phoneNumber: auth.firebaseUser.value!.phoneNumber ?? '000000000',
      );
      if (!await userRepo.isEmailExisted(model.email)) {
        userRepo.createUser(model);
      }
    } catch (e) {
      isGoogleLoading.value = false;
      Get.snackbar(
        'Lỗi',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      if (kDebugMode) {
        print(e.toString());
      }
      GoogleSignIn().signOut();
    }
  }

  Future<void> facebookSignIn() async {
    try {
      isFacebookLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await auth.signInWithFacebook();
      isFacebookLoading.value = false;

      auth.setInitialScreen(auth.firebaseUser.value);
      final names = auth.firebaseUser.value!.displayName!.split(' ');

      final model = UserModel(
        firstName: names[0],
        lastName: names.sublist(1).join(' '),
        email: auth.firebaseUser.value!.email!,
        phoneNumber: auth.firebaseUser.value!.phoneNumber ?? '000000000',
      );
      if (!await userRepo.isEmailExisted(model.email)) {
        userRepo.createUser(model);
      }
    } catch (e) {
      isFacebookLoading.value = false;
      Get.snackbar(
        'Lỗi',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      // FacebookAuth.instance.logOut();
    }
  }
}
