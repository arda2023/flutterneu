// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionList)
final transactionListProvider = TransactionListProvider._();

final class TransactionListProvider
    extends $NotifierProvider<TransactionList, List<TBox>> {
  TransactionListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionListProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionListHash();

  @$internal
  @override
  TransactionList create() => TransactionList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TBox> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TBox>>(value),
    );
  }
}

String _$transactionListHash() => r'196d0df663b9a9d1e893736cb5beb9a2285afdc9';

abstract class _$TransactionList extends $Notifier<List<TBox>> {
  List<TBox> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<TBox>, List<TBox>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TBox>, List<TBox>>,
              List<TBox>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
