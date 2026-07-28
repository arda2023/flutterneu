import 'package:flutter/material.dart';

class TodoBox extends StatelessWidget {
  final String text;
  final VoidCallback onDeleted;
  const TodoBox({super.key, required this.text, required this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.blue),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Text(text),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
