import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CreateNewsScreen extends StatelessWidget {
  const CreateNewsScreen({super.key});

  void showBottomModal(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown Button'),
        actions: [
          IconButton(
              onPressed: () {
                showBottomModal(context);
              },
              icon: const Icon(Iconsax.add))
        ],
      ),
      body: const Center(
        child: SizedBox(),
      ),
    );
  }
}
