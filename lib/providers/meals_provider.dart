import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterneu/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
