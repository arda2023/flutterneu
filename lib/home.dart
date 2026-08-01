import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterneu/deleted_notifier.dart';
import 'package:flutterneu/todo.dart';
import 'package:flutterneu/todo_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodos = ref.watch(todoNProvider);
    final controller = TextEditingController();
    final List<DeletedTodo> deletedList = ref.watch(deletedProvider);
    print('Deleted: $deletedList');

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
                    ElevatedButton(
                      onPressed: () {
                        ref
                            .read(todoNProvider.notifier)
                            .addTodo(controller.text);
                        controller.clear();
                      },
                      child: Text("Hinzufügen"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              asyncTodos.when(
                data: (todos) => Column(
                  children: [
                    ...todos.map(
                      (einString) => TodoBox(
                        text: einString,

                        onDeleted: () {
                          ref
                              .read(todoNProvider.notifier)
                              .removeTodo(einString);

                          ref.read(deletedProvider.notifier).add(einString);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Text("${ref.read(deletedProvider).length}"),
                                  Text("ToDo gelöscht"),
                                ],
                              ),
                              duration: Duration(seconds: 3),
                              width: 280,
                              padding: .symmetric(horizontal: 8),
                              action: SnackBarAction(
                                label: "Wiederherstellen",
                                onPressed: () {
                                  ref
                                      .read(deletedProvider.notifier)
                                      .restoreAll();
                                },
                              ),
                              behavior: .floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: .circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                error: (err, stack) => Text("Fehler"),
                loading: () => Text("Lädt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
