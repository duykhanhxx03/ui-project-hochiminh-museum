import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/loading/custom_loading.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/profile_controller.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/profile/update_password.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/profile/update_profile.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.didPop});
  void Function() didPop;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  //final controllerNav = Get.put(NavigationController(initialIndex: 3));

  late String userAvatarURL;

  void didPop() {
    // ignore: invalid_use_of_protected_member
    (context as Element).reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Hồ sơ'),
        showBackArrow: true,
        backOnPress: () {
          widget.didPop();
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    final data = snapshot.data as UserModel;
                    userAvatarURL = data.profileImageUrl;
                    return Column(
                      children: [
                        //Profile picture
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: TColors.white,
                                backgroundImage: CachedNetworkImageProvider(
                                  userAvatarURL,
                                ),
                                radius: 60,
                              ),
                              TextButton(
                                onPressed: () async {
                                  final imagePicker = ImagePicker();
                                  final XFile? pickedFile = await imagePicker
                                      .pickImage(source: ImageSource.gallery);

                                  if (pickedFile != null) {
                                    SmartDialog.showLoading(
                                      animationType: SmartAnimationType.scale,
                                      builder: (_) => const CustomLoading(),
                                    );
                                    String uniqueFileName =
                                        '${DateTime.now().millisecondsSinceEpoch}.jpg';
                                    // You might need to update the imageURL in the controller or wherever it is stored
                                    Reference referenceRoot =
                                        FirebaseStorage.instance.ref();
                                    Reference referenceDirImages =
                                        referenceRoot.child('profiles');

                                    Reference referenceImageToUpload =
                                        referenceDirImages
                                            .child(uniqueFileName);

                                    try {
                                      await referenceImageToUpload
                                          .putFile(File(pickedFile.path));
                                      userAvatarURL =
                                          await referenceImageToUpload
                                              .getDownloadURL();
                                      //print(userAvatarURL);
                                      UserModel userData = UserModel(
                                        id: data.id,
                                        firstName: data.firstName,
                                        lastName: data.lastName,
                                        email: data.email,
                                        phoneNumber: data.phoneNumber,
                                        password: data.password,
                                        profileImageUrl: userAvatarURL,
                                      );

                                      await controller.updateUser(userData);
                                      setState(() {
                                        userAvatarURL = userAvatarURL;
                                      });
                                      SmartDialog.dismiss();
                                    } catch (error) {
                                      if (kDebugMode) {
                                        print(error);
                                      }
                                    }
                                  } else {
                                    Get.snackbar('Thông báo', 'Chưa chọn ảnh',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            Colors.red.withOpacity(0.1),
                                        colorText: Colors.redAccent,
                                        duration: const Duration(seconds: 1));
                                  }
                                },
                                child: const Text(
                                  'Đổi ảnh đại diện',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Details
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSectionHeading(
                          title: 'Thông tin hồ sơ',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        TProfileMenu(
                          onPressed: () {},
                          title: 'Tên đầy đủ',
                          value: '${data.lastName} ${data.firstName}',
                        ),

                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSectionHeading(
                          title: 'Thông tin cá nhân',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        TProfileMenu(
                          onPressed: () {},
                          title: 'Email',
                          value: data.email,
                        ),
                        TProfileMenu(
                          onPressed: () {},
                          title: 'Số điện thoại',
                          value: data.phoneNumber!,
                        ),
                        TProfileMenu(
                          onPressed: () {},
                          title: 'Giới tính',
                          value: 'None',
                        ),
                        TProfileMenu(
                          onPressed: () {},
                          title: 'Ngày sinh',
                          value: '01/01/1970',
                        ),
                        const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(
                                () => ProfileUpdateScreen(
                                  didPop: didPop,
                                ),
                                transition: Transition.cupertino,
                              );
                            },
                            child: const Text(
                              'Sửa đổi thông tin',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        if (controller.getProviderId() != 'google.com' &&
                            controller.getProviderId() != 'facebook.com')
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Get.to(
                                  () => PasswordUpdateScreen(
                                    didPop: didPop,
                                  ),
                                  transition: Transition.cupertino,
                                );
                              },
                              child: const Text(
                                'Đổi mật khẩu',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Đóng tài khoản',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
