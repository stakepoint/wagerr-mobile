import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<String?>((ref) => null);

final categoriesProvider = Provider<List<String>>((ref) => [
      'Sports',
      'ESports',
      'Politics',
      'Crypto',
      'Stocks',
      'Entertainment',
      'Games',
      'Others'
    ]);
