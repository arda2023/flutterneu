import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoN extends _$TodoN {
  @override
  List<String> build() => [];
  void addTodo(String text) {
    state = [...state, text];
  }

  void removeTodo(String text) {
    state = state.where((item) => item != text).toList();
    print(text);
  }
}
