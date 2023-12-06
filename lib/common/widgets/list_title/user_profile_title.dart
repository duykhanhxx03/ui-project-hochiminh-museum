import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/personalization/screens/profile/profile.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';

class TUserProfileTitle extends StatefulWidget {
  const TUserProfileTitle({
    super.key,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.avatar_imgURL,
    required this.didPop,
  });

  final String lastName;
  final String firstName;
  final String email;
  final String avatar_imgURL;

  final void Function() didPop;

  @override
  State<TUserProfileTitle> createState() => _TUserProfileTitleState();
}

class _TUserProfileTitleState extends State<TUserProfileTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          widget.avatar_imgURL,
        ),
        radius: 35,
      ),
      title: Text(
        '${widget.firstName} ${widget.lastName}',
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: TColors.white,
            ),
      ),
      subtitle: Text(
        widget.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: () async {
          await Get.to(
            () => ProfileScreen(didPop: widget.didPop),
            transition: Transition.cupertino,
          );
        },
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
