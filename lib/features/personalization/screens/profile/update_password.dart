import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/profile_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/validators/validation.dart';

class PasswordUpdateScreen extends StatefulWidget {
  const PasswordUpdateScreen({Key? key, required this.didPop})
      : super(key: key);

  final void Function() didPop;

  @override
  State<PasswordUpdateScreen> createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  final controller1 = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Đổi mật khẩu'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
            future: controller1.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userModel = snapshot.data as UserModel;

                  //Controllers
                  final oldPassword = TextEditingController();
                  final newPassword = TextEditingController();
                  final retypePassword = TextEditingController();

                  return Column(
                    children: [
                      /// -- Form Fields
                      Obx(
                        () => Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: oldPassword,
                                obscureText: !controller1.showPassword.value,
                                validator: (value) =>
                                    TValidator.validateOldPassword(
                                        value, userModel.password),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('Old Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller1.showPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      controller1.showPassword.value =
                                          !controller1.showPassword.value;
                                      // Toggle showPassword state
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              TextFormField(
                                controller: newPassword,
                                obscureText: !controller1.showNewPassword.value,
                                validator: TValidator.validatePassword,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('New Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller1.showNewPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      controller1.showNewPassword.value =
                                          !controller1.showNewPassword.value;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              TextFormField(
                                controller: retypePassword,
                                obscureText:
                                    !controller1.showRetypePassword.value,
                                validator: (value) =>
                                    TValidator.validateRetypePassword(
                                        value, newPassword.text),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  label: const Text('Retype Password'),
                                  prefixIcon:
                                      const Icon(Iconsax.password_check),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        controller1.showRetypePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                    onPressed: () {
                                      controller1.showRetypePassword.value =
                                          !controller1.showRetypePassword.value;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              /// -Form Submit Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      final userData = UserModel(
                                        id: userModel.id,
                                        firstName: userModel.firstName,
                                        lastName: userModel.lastName,
                                        email: userModel.email,
                                        phoneNumber: userModel.phoneNumber,
                                        password: newPassword.text.trim(),
                                        profileImageUrl:
                                            userModel.profileImageUrl,
                                        isAdmin: userModel.isAdmin,
                                      );

                                      await controller1.updateUser(userData);
                                      await controller1
                                          .updatePassword(userModel);
                                      // Navigator.pop(context,
                                      //     MaterialPageRoute(builder: (context) => ProfileScreen()));

                                      widget.didPop();
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text(
                                    'Cập nhật mật khẩu',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
