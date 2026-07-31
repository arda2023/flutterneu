// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Deleted)
final deletedProvider = DeletedProvider._();

final class DeletedProvider
    extends $NotifierProvider<Deleted, List<DeletedTodo>> {
  DeletedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deletedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deletedHash();

  @$internal
  @override
  Deleted create() => Deleted();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DeletedTodo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DeletedTodo>>(value),
    );
  }
}

String _$deletedHash() => r'f48df6aadaf8a945a0a3beeb87ecfb9a5dafd61c';

abstract class _$Deleted extends $Notifier<List<DeletedTodo>> {
  List<DeletedTodo> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<DeletedTodo>, List<DeletedTodo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<DeletedTodo>, List<DeletedTodo>>,
              List<DeletedTodo>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
