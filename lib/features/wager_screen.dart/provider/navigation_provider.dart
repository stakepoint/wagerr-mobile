import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/routing/routes.dart';

final navigationStateProvider =
    StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void updateIndex(int index) {
    state = index;
  }

  void updateIndexFromRoute(String route) {
    switch (route) {
      case Routes.home:
      case Routes.homeTablet:
        state = 0;
        break;
      case Routes.wager:
      case Routes.wagerTablet:
        state = 1;
        break;
      case Routes.wallet:
      case Routes.walletTablet:
        state = 2;
        break;
      case Routes.profile:
      case Routes.profileTablet:
        state = 3;
        break;
      default:
        state = 0;
    }
  }
}
