import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_video_album/controllers/create_video_album_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class CreateVideoAlbumScreen extends StatefulWidget {
  const CreateVideoAlbumScreen({super.key});

  @override
  State<CreateVideoAlbumScreen> createState() => _CreateVideoAlbumScreenState();
}

class _CreateVideoAlbumScreenState extends State<CreateVideoAlbumScreen> {
  final controller = Get.put(CreateVideoAlbumController());
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void upload(RoundedLoadingButtonController btnController) async {
    await controller.uploadAlbumVideo();
    btnController.success();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Thêm thư viện video'),
        showBackArrow: true,
        actions: [
          RoundedLoadingButton(
            color: TColors.primary,
            successColor: TColors.success,
            errorColor: TColors.error,
            width: TSizes.buttonWidth,
            successIcon: Icons.check,
            failedIcon: Icons.close,
            controller: btnController,
            onPressed: () {
              upload(btnController);
            },
            child: const Text(
              'Tải lên',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TextField(
              controller: controller.title,
              decoration: const InputDecoration(labelText: 'Tiêu đề'),
              minLines: 2,
              maxLines: 3,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TextField(
              controller: controller.youtubeUrl,
              decoration: const InputDecoration(labelText: 'Youtube video url'),
              minLines: 1,
              maxLines: 2,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
