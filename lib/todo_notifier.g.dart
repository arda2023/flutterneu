// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoN)
final todoNProvider = TodoNProvider._();

final class TodoNProvider extends $AsyncNotifierProvider<TodoN, List<String>> {
  TodoNProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoNProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoNHash();

  @$internal
  @override
  TodoN create() => TodoN();
}

String _$todoNHash() => r'd9fdbe2cabcee2e4b3ca804aa476528bcb241423';

abstract class _$TodoN extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
