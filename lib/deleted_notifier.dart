import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deleted_notifier.g.dart';

@riverpod
class Deleted extends _$Deleted {
  @override
  List<String> build() {
    return [];
  }

  void add(String text) {
    state = [...state, text];
  }

  void remove(String text) {
    state = state.where((item) {
      return item != text;
    }).toList();
  }
}
