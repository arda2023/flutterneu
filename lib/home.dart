import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterneu/deleted_notifier.dart';
import 'package:flutterneu/todo.dart';
import 'package:flutterneu/todo_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncTodos = ref.watch(todoNProvider);
    final List<DeletedTodo> deletedList = ref.watch(deletedProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.amber),
                width: double.infinity,
                height: 150,
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "Schreibe was",
                      ),
                      controller: _controller,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller.text.isNotEmpty) {
                          ref
                              .read(todoNProvider.notifier)
                              .addTodo(_controller.text);
                          _controller.clear();
                        }
                      },
                      child: const Text("Hinzufügen"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

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

                          // Warteschlange zurücksetzen
                          ScaffoldMessenger.of(context).clearSnackBars();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Text("${ref.read(deletedProvider).length} "),
                                  const Text("ToDo gelöscht"),
                                ],
                              ),
                              duration: const Duration(seconds: 3),
                              width: 280,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              action: SnackBarAction(
                                label: "Wiederherstellen",
                                onPressed: () {
                                  ref
                                      .read(deletedProvider.notifier)
                                      .restoreAll();
                                  ScaffoldMessenger.of(
                                    context,
                                  ).hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                error: (err, stack) => const Text("Fehler"),
                loading: () => const Text("Lädt"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
