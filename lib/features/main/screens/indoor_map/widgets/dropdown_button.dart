import 'package:flutter/material.dart';
import "package:ui_project_hochiminh_museum/utils/constants/sizes.dart";

const List<String> floors = <String>['Tầng 1', 'Tầng 2', 'Tầng 3'];

class IndoorMapDropdownMenu extends StatefulWidget {
  const IndoorMapDropdownMenu({super.key, required this.changeFloor});

  final void Function(int) changeFloor;

  @override
  State<IndoorMapDropdownMenu> createState() => _IndoorMapDropdownMenuState();
}

class _IndoorMapDropdownMenuState extends State<IndoorMapDropdownMenu> {
  String dropdownValue = floors.first;

  // List of items in our dropdown menu
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: const BorderRadius.all(
        Radius.circular(TSizes.borderRadiusMd),
      ),
      // Initial Value
      value: dropdownValue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: floors.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              items,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          widget.changeFloor(floors.indexOf(newValue));
        });
      },
    );
  }
}
