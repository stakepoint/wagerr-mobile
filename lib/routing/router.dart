import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/connect_wallet/connect_wallet_screen.dart';
import 'package:starkwager/features/home_screen/home_screen.dart';
import 'package:starkwager/features/home_screen/naviagtion.dart';
import 'package:starkwager/features/home_screen/widget/home_screen_tablet_menu_bar.dart';

import '../routing/routes.dart';

class SlideRouteTransition extends CustomTransitionPage<void> {
  SlideRouteTransition({required super.child, required String routeName})
      : super(
          key: ValueKey(routeName),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            final curve = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );
            final tween = Tween(begin: begin, end: end);
            final offsetAnimation = tween.animate(curve);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      pageBuilder: (context, state) => SlideRouteTransition(
        child: ConnectWalletScreen(),
        routeName: Routes.splash,
      ),
    ),

//----------------------------------------------- Tablet Shell Route ----------------------------------------------- //

    ShellRoute(
      builder: (context, state, child) {
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;

        return ScreenLayout.isTablet(context)
            ? isLandscape
                ? HomeScreenTabletMenuBar(child: child)
                : ScaffoldWithNavBar(child: child)
            : const SizedBox.shrink();
      },
      routes: [
        GoRoute(
          path: Routes.home_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.home_tablet,
          ),
        ),
        GoRoute(
          path: Routes.wagger_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.wagger_tablet,
          ),
        ),
        GoRoute(
          path: Routes.profile_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.profile_tablet,
          ),
        ),
        GoRoute(
          path: Routes.wallet_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.wallet_tablet,
          ),
        ),
      ],
    ),

    //----------------------------------------------- Mobile Shell Route ----------------------------------------------- //

    ShellRoute(
      builder: (context, state, child) => ScreenLayout.isMobile(context)
          ? ScaffoldWithNavBar(child: child)
          : const SizedBox.shrink(),
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.home,
          ),
        ),
        GoRoute(
          path: Routes.wagger,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.wagger,
          ),
        ),
        GoRoute(
          path: Routes.profile,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.profile,
          ),
        ),
        GoRoute(
          path: Routes.wallet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.wallet,
          ),
        ),
      ],
    ),
  ],
);
