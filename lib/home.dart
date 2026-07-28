import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterneu/todo.dart';
import 'package:flutterneu/todo_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoNProvider);
    todos.map((einString) => Text(einString)).toList();
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.amber),
                width: double.infinity,
                height: 150,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Schreibe was"),
                      controller: controller,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Hinzufügen")),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TodoBox(text: controller.text),
            ],
          ),
        ),
      ),
    );
  }
}
