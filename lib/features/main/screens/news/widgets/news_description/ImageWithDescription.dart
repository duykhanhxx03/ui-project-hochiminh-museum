import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/common/models/image_withdes_model.dart';
import 'package:ui_project_hochiminh_museum/common/widgets/images/t_rounded_image.dart';

class ImageWithDesWidget extends StatelessWidget {
  const ImageWithDesWidget({super.key, required this.image});
  final ImageWithDescription image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedImage(
          imageUrl: image.imageUrl,
          applyImageRadius: false,
          fit: BoxFit.fitWidth,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(image.description)],
        ),
      ],
    );
  }
}
