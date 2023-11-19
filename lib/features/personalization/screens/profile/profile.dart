import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_circular_image.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/profile_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Hồ sơ'),
        showBackArrow: true,
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

                    return Column(
                      children: [
                        //Profile picture
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const TCircularImage(
                                image: TImages.user,
                                width: 80,
                                height: 80,
                                padding: 0,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Đổi ảnh đại diện'),
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
                          value: data.phoneNumber,
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
                            onPressed: () {},
                            child: const Text(
                              'Đóng tài khoản',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
