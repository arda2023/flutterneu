import 'package:flutterneu/todo_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deleted_notifier.g.dart';

class DeletedTodo {
  final String text;
  final DateTime deletedAt;
  const DeletedTodo({required this.deletedAt, required this.text});
  @override
  String toString() => 'DeletedTodo(text: $text, deletedAt: $deletedAt)';
}

@riverpod
class Deleted extends _$Deleted {
  @override
  List<DeletedTodo> build() => [];

  void add(String text) {
    removeExpired();
    var o = DeletedTodo(deletedAt: DateTime.now(), text: text);
    state = [...state, o];
  }

  void remove(String text) {
    state = state.where((item) {
      return item.text != text;
    }).toList();
  }

  void removeExpired() {
    state = state
        .where(
          (item) => DateTime.now().difference(item.deletedAt).inSeconds < 10,
        )
        .toList();
  }

  void restoreAll() {
    for (var a in state) {
      ref.read(todoNProvider.notifier).addTodo(a.text);
    }
    state = [];
  }
}
