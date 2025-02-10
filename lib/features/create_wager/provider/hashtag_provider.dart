import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/features/create_wager/state/hashtag_state.dart';

final selectedHashtagsProvider =
    StateNotifierProvider<HashtagsNotifier, Set<String>>((ref) {
  return HashtagsNotifier();
});

final wagerTitleProvider =
    StateNotifierProvider<WagerTitleNotifier, String>((ref) {
  return WagerTitleNotifier();
});

final hashtagsListProvider = Provider<List<String>>((ref) {
  return [
    'Bitcoin',
    'STRKBet',
    'BTCto100k',
    'CryptoBetting',
    'BlockchainWager',
    'CryptoTrends',
    'Web3Challenge',
    'DeFiPrediction'
  ];
});
