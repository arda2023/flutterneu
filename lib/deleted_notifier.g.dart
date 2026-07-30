// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Deleted)
final deletedProvider = DeletedProvider._();

final class DeletedProvider extends $NotifierProvider<Deleted, List<String>> {
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
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$deletedHash() => r'b8708a11db494293644057d7e9762507946bc7a1';

abstract class _$Deleted extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
