import 'package:flutter/material.dart';

import 'class_b.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    String message = "Hello from Page A!";

    return Scaffold(
      appBar: AppBar(title: const Text("Page A")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Page B"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageB(data: message),
              ),
            );
          },
        ),
      ),
    );
  }
}