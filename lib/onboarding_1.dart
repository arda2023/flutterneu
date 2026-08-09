import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Page1"),
          ElevatedButton(onPressed: () {}, child: Text("Next Page")),
        ],
      ),
    );
  }
}
