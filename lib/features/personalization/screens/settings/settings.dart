import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/list_title/settings_menu_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

import '../../../../common/widgets/list_title/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
                  const TUserProfileTitle(),
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
                        onPressed: () {}, child: const Text('Logout')),
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
