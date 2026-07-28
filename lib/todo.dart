import 'package:flutter/material.dart';

class TodoBox extends StatelessWidget {
  final String text;
  const TodoBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        width: double.infinity,
        height: 100,
        child: Text(text),
      ),
    );
  }
}
