import 'package:flutter/material.dart';

const List<String> list = <String>['Tầng 1', 'Tầng 2', 'Tầng 3'];

class OKDropdownMenu extends StatefulWidget {
  const OKDropdownMenu({super.key});

  @override
  State<OKDropdownMenu> createState() => _OKDropdownMenuState();
}

class _OKDropdownMenuState extends State<OKDropdownMenu> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: const ButtonStyle(),
        );
      }).toList(),
    );
  }
}
