import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deleted_notifier.g.dart';

class DeletedTodo {
  final String text;
  final DateTime deletedAt;
  const DeletedTodo({required this.deletedAt, required this.text});
}

@riverpod
class Deleted extends _$Deleted {
  @override
  List<DeletedTodo> build() => [];

  void add(String text) {
    final now = DeletedTodo(deletedAt: DateTime.now(), text: text);
    state = [...state, now];
  }

  void remove(String text) {
    state = state.where((item) {
      return item != text;
    }).toList();
  }
}
