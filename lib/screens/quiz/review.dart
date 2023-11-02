import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() {
    return _ReviewScreen();
  }
}

class _ReviewScreen extends State<ReviewScreen> {
  Color _iconColor = const Color.fromARGB(255, 124, 118, 118);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 173, 7, 7),
            leading: const BackButton(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            title: const Text('Comments'),
            centerTitle: true),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      //Avatar
                      backgroundColor: Colors.blueGrey,
                    ),
                    title: const Text('Name user'),
                    subtitle: Column(
                      children: [
                        const Text(
                          'cmt: asndjnjifbnjerbngfndfbgib',
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _iconColor =
                                      const Color.fromARGB(255, 233, 4, 4);
                                });
                              },
                              icon: Icon(Icons.favorite, color: _iconColor),
                            ),
                            const Text('num'), // so luot tha tim
                            TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.bottomRight,
                                textStyle: const TextStyle(fontSize: 14),
                              ),
                              onPressed: () {},
                              child: const Text('Reply'),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Color.fromARGB(255, 167, 165, 165),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your comment...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Xử lý khi người dùng gửi bình luận
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
