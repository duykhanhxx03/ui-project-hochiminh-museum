import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/search.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      actions: [
        IconButton(
          color: TColors.white,
          icon: const Icon(Iconsax.search_normal),
          onPressed: () {
            Get.to(const SearchScreen());
          },
        ),
        IconButton(
          color: TColors.white,
          icon: const Icon(Iconsax.notification),
          onPressed: () async {},
        ),
      ],
      showBackArrow: false,
      title: const Hero(
        tag: 'app-logo',
        child: Image(
            width: 100, height: 100, image: AssetImage(TImages.lightAppLogo)),
      ),
    );
  }
}
