import 'package:flutterneu/transactions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionList extends _$TransactionList {
  @override
  List<TBox> build() {
    return tboxlist;
  }

  void addTransaction(TBox neu) {
    state = [...state, neu];
  }
}
