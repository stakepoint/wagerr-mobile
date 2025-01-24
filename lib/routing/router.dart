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
      builder: (context, state, child) => ScreenLayout.isTablet(context)
          ? HomeScreenTabletMenuBar(
              child: child,
            )
          : const SizedBox.shrink(),
      routes: [
        GoRoute(
          path: Routes.home_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.home_tablet,
          ),
        ),
        GoRoute(
          path: Routes.search_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.search_tablet,
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
          path: Routes.settings_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.settings_tablet,
          ),
        ),
      ],
    ),

    //----------------------------------------------- Portrait Tablet Shell Route ----------------------------------------------- //

    ShellRoute(
      builder: (context, state, child) => ScreenLayout.isTablet(context)
          ? ScaffoldWithNavBar(
              child: child,
            )
          : const SizedBox.shrink(),
      routes: [
        GoRoute(
          path: Routes.home_tablet_potriate,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.home_tablet_potriate,
          ),
        ),
        GoRoute(
          path: Routes.search_tablet_potriate,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.search_tablet_potriate,
          ),
        ),
        GoRoute(
          path: Routes.profile_tablet_potriate,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.profile_tablet_potriate,
          ),
        ),
        GoRoute(
          path: Routes.settings_tablet_potriate,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.settings_tablet_potriate,
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
          path: Routes.search,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.search,
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
          path: Routes.settings,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: HomeScreen(),
            routeName: Routes.settings,
          ),
        ),
      ],
    ),
  ],
);
