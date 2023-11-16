import 'package:flutter/material.dart';

const List<String> floors = <String>['Tầng 1', 'Tầng 2', 'Tầng 3'];

class IndoorMapDropdownMenu extends StatefulWidget {
  const IndoorMapDropdownMenu({super.key, required this.changeFloor});

  final void Function(int) changeFloor;

  @override
  State<IndoorMapDropdownMenu> createState() => _IndoorMapDropdownMenuState();
}

class _IndoorMapDropdownMenuState extends State<IndoorMapDropdownMenu> {
  String dropdownValue = floors.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: floors.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
        widget.changeFloor(floors.indexOf(value!));
      },
      dropdownMenuEntries:
          floors.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: const ButtonStyle(),
        );
      }).toList(),
    );
  }
}
