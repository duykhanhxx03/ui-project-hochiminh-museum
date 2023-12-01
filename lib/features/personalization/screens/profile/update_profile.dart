import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/profile_controller.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/profile/profile.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final controller1 = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa đổi thông tin'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.off(const ProfileScreen()),
            icon: const Icon(Iconsax.arrow_left)),
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
                  final email = TextEditingController(text: userModel.email);
                  final password =
                      TextEditingController(text: userModel.password);
                  final firstName =
                      TextEditingController(text: userModel.firstName);
                  final lastName =
                      TextEditingController(text: userModel.lastName);
                  final phoneNumber =
                      TextEditingController(text: userModel.phoneNumber);

                  return Column(
                    children: [
                      /// -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userModel.email,
                              enabled: false,
                              decoration: const InputDecoration(
                                label: Text('Email'),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: firstName,
                              decoration: const InputDecoration(
                                label: Text('FirstName'),
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: lastName,
                              decoration: const InputDecoration(
                                label: Text('LastName'),
                                prefixIcon: Icon(Iconsax.user),
                              ),
                            ),
                            const SizedBox(height: 32),
                            TextFormField(
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                label: Text('PhoneNumber'),
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(height: 32),
                            // TextFormField(
                            //   controller: password,
                            //   //obscureText: true, thử đi
                            //   decoration: const InputDecoration(
                            //     label: Text('Password'), prefixIcon: Icon(Iconsax.password_check),
                            //   ),
                            // ),
                            // const SizedBox(height: 32),

                            /// -Form Submit Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final userData = UserModel(
                                    id: userModel.id,
                                    firstName: firstName.text.trim(),
                                    lastName: lastName.text.trim(),
                                    email: email.text.trim(),
                                    phoneNumber: phoneNumber.text.trim(),
                                    password: userModel.password,
                                    avatar_imgURL: userModel.avatar_imgURL,
                                  );

                                  await controller1.updateUser(userData);
                                  // Navigator.pop(context,
                                  //     MaterialPageRoute(builder: (context) => ProfileScreen()));
                                  Get.off(() => const ProfileScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.primary,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text('Cập nhật',
                                    style: TextStyle(
                                        color: TColors.black, fontSize: 18)),
                              ),
                            )
                          ],
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
