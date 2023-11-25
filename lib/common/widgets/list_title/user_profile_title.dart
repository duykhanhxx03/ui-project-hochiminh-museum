import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_circular_image.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/profile/profile.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    required this.lastName,
    required this.firstName,
    required this.email,
  });

  final String lastName;
  final String firstName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        '$firstName $lastName',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: TColors.white,
            ),
      ),
      subtitle: Text(
        email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(ProfileScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
