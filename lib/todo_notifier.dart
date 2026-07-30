import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoN extends _$TodoN {
  @override
  Future<List<String>> build() async {
    await Future.delayed(Duration(seconds: 5));
    return [];
  }

  void addTodo(String text) {
    final currentList = state.value ?? [];
    state = AsyncValue.data([...currentList, text]);
  }

  void removeTodo(String text) {
    final liste = state.value ?? [];
    final gefiltert = liste.where((item) => item != text).toList();
    state = AsyncValue.data(gefiltert);
  }
}
