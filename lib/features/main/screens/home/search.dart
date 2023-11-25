import 'package:flutter/material.dart';

void main() {
  runApp(const SearchScreen());
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Search'),
      ),
      body: TextField(
        decoration: const InputDecoration(
          hintText: 'Tìm kiếm...',
        ),
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }
}
