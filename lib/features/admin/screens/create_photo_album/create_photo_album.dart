import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/appbar/appbar.dart';
import 'package:ui_project_hochiminh_museum/features/admin/screens/create_photo_album/controllers/create_photo_album_controller.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CreatePhotoAlbumScreen extends StatefulWidget {
  const CreatePhotoAlbumScreen({super.key});

  @override
  State<CreatePhotoAlbumScreen> createState() => _CreatePhotoAlbumScreenState();
}

class _CreatePhotoAlbumScreenState extends State<CreatePhotoAlbumScreen> {
  final ImagePicker imagePicker = ImagePicker();
  final controller = Get.put(CreatePhotoAlbumController());
  List<XFile> imageFileList = [];
  void selectImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }

  void upload(RoundedLoadingButtonController btnController) async {
    try {
      await controller.uploadAlbumPhoto(imageFileList);
      btnController.success();
    } catch (error) {
      btnController.error();
      print(error);
    }
  }

  RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const Text('Thêm thư viện ảnh'),
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
        child: ListView(
          children: [
            const SizedBox(height: TSizes.defaultSpace),
            TextField(
              controller: controller.title,
              decoration: const InputDecoration(labelText: 'Tiêu đề'),
              minLines: 2,
              maxLines: 3,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TextField(
              controller: controller.description,
              decoration: const InputDecoration(labelText: 'Miêu tả'),
              minLines: 4,
              maxLines: 7,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: imageFileList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: TSizes.xs,
                  mainAxisSpacing: TSizes.xs,
                ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? Center(
                          child: IconButton(
                            onPressed: () {
                              selectImages();
                            },
                            icon: const Icon(Iconsax.add),
                          ),
                        )
                      : Stack(
                          children: [
                            Image.file(
                              File(imageFileList[index - 1].path),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    imageFileList.removeAt(index - 1);
                                  });
                                },
                                icon: const Icon(
                                  Iconsax.close_circle,
                                  size: 20,
                                  color: Color.fromARGB(255, 255, 162, 162),
                                ),
                              ),
                            )
                          ],
                        );
                })
          ],
        ),
      ),
    );
  }
}
