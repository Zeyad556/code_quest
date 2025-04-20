import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  final String data;

  const PageB({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page B")),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
