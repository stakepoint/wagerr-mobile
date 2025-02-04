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
      case Routes.home_tablet:
        state = 0;
        break;
      case Routes.wager:
      case Routes.wager_tablet:
        state = 1;
        break;
      case Routes.wallet:
      case Routes.wallet_tablet:
        state = 2;
        break;
      case Routes.profile:
      case Routes.profile_tablet:
        state = 3;
        break;
      default:
        state = 0;
    }
  }
}
