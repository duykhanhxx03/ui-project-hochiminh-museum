import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/list_title/settings_menu_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/settings_controller.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import '../../../../common/widgets/list_title/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Headers
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  TAppBar(
                    title: Text(
                      'Cài đặt',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: TColors.white,
                              ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //Profile picture
                  FutureBuilder(
                    future: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel userModel = snapshot.data as UserModel;

                          return TUserProfileTitle(
                            email: userModel.email,
                            firstName: userModel.firstName,
                            lastName: userModel.lastName,
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account settings
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {
                      print((controller.getUserData() == null));
                    },
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                  ),

                  //System settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {},
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  //Logout button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {
                          AuthenticationRepository.instance.logout();
                        },
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
