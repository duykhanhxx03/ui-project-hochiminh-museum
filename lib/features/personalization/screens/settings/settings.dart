import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/list_title/settings_menu_title.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/loading/custom_loading.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/texts/section_heading.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_news/widgets/choose_category_subcategory.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_photo_album/create_photo_album.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_video_album/create_video_album.dart';
import 'package:ui_project_hochiminh_museum/features/authentication/models/user_model.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/controllers/settings_controller.dart';
import 'package:ui_project_hochiminh_museum/repository/authentication_repository/authentication_repository.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:ui_project_hochiminh_museum/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/list_title/user_profile_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = Get.put(SettingsController());

  late bool _isThemeModeSystemSetting =
      controller.getCurrentTheme() == ThemeMode.system;

  void showNewsCreateCategoryOptions(BuildContext context, Widget child) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }

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

                          return SizedBox(
                            height: 65,
                            child: TUserProfileTitle(
                              avatar_imgURL: userModel.avatar_imgURL,
                              email: userModel.email,
                              firstName: userModel.firstName,
                              lastName: userModel.lastName,
                            ),
                          );
                        }
                      }
                      return const SizedBox(
                        height: 65,
                        child: Center(
                          child: Center(child: CustomLoading()),
                        ),
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
                  //Admin settings
                  const TSectionHeading(
                    title: 'Admin',
                    showActionButton: false,
                  ),

                  TSettingsMenuTitle(
                    title: 'Viết báo',
                    icon: Iconsax.pen_add,
                    subtitle: 'Soạn thảo báo',
                    onPressed: () {
                      showNewsCreateCategoryOptions(
                          context, const ChooseCategoryAndSubCategory());
                    },
                  ),
                  TSettingsMenuTitle(
                    title: 'Thêm thư viện ảnh',
                    icon: Iconsax.pen_add,
                    subtitle: 'Đăng ảnh',
                    onPressed: () {
                      Get.to(const CreatePhotoAlbumScreen());
                    },
                  ),
                  TSettingsMenuTitle(
                    title: 'Thêm thư viện video',
                    icon: Iconsax.pen_add,
                    subtitle: 'Đăng video',
                    onPressed: () {
                      Get.to(const CreateVideoAlbumScreen());
                    },
                  ),
                  //Account settings
                  const TSectionHeading(
                    title: 'Cài đặt tài khoản',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                    title: 'My address',
                    icon: Iconsax.safe_home,
                    subtitle: 'abc abc abc abc',
                    onPressed: () {
                      if (kDebugMode) {
                        print((controller.getUserData() == null));
                      }
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

                  //System settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Cài đặt hệ thống',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                    title: 'Dark mode',
                    icon: Iconsax.safe_home,
                    subtitle: 'Thay đổi chế độ sáng tối',
                    onPressed: () {},
                    trailing: Switch(
                      value: THelperFunctions.isDarkMode(context),
                      onChanged: _isThemeModeSystemSetting
                          ? null
                          : (value) {
                              setState(() {
                                controller.setCurrentTheme(
                                  THelperFunctions.isDarkMode(context)
                                      ? ThemeMode.light
                                      : ThemeMode.dark,
                                );
                              });
                            },
                    ),
                  ),
                  TSettingsMenuTitle(
                    title: 'Dark/ Light mode tự động',
                    icon: Iconsax.safe_home,
                    subtitle:
                        'Cài đặt giao diện sáng tối thích ứng với hệ thống',
                    onPressed: () {},
                    trailing: Switch(
                      value: _isThemeModeSystemSetting,
                      onChanged: (value) {
                        setState(() {
                          _isThemeModeSystemSetting = value;
                        });
                      },
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
