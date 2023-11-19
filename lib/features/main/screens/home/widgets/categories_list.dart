import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_project_hochiminh_museum/features/main/screens/home/widgets/squared_button.dart';
import 'package:ui_project_hochiminh_museum/utils/constants/sizes.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  void _showBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
      child: GridView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3 / 5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.green,
            onTap: () {
              _showBottomModal(context);
            },
            icon: Iconsax.book_1,
          ),
          SquaredButton(
            label: 'Nghiên cứu',
            backgroundColor: Colors.lightBlue,
            onTap: () {},
            icon: Iconsax.receipt_search,
          ),
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: const Color.fromARGB(255, 206, 186, 9),
            onTap: () {},
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.redAccent,
            onTap: () {},
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.yellow,
            onTap: () {
              _showBottomModal(context);
            },
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Nghiên cứu',
            backgroundColor: Colors.redAccent,
            onTap: () {},
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.blue,
            onTap: () {},
            icon: Iconsax.book,
          ),
          SquaredButton(
            label: 'Tin tức - Sự kiện',
            backgroundColor: Colors.blueGrey,
            onTap: () {},
            icon: Iconsax.book,
          ),
        ],
      ),
    );
  }
}
