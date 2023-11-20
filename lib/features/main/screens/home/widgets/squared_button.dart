import 'package:flutter/material.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/colors.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class SquaredButton extends StatelessWidget {
  const SquaredButton({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: TSizes.squaredButton,
          width: TSizes.squaredButton,
          child: InkWell(
            //Hover decoration setup later
            onTap: onTap,
            child: Card(
              elevation: 0,
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLLg),
              ),
              child: Center(
                child: Icon(icon, color: TColors.textWhite),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            label,
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
