import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/screen_layout.dart';


import '../features/feature.dart';
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
    GoRoute(
      path: Routes.profileSetup,
      pageBuilder: (context, state) => SlideRouteTransition(
        child: ProfileSetupScreen(),
        routeName: Routes.profileSetup,
      ),
    ),

    GoRoute(
      path: Routes.create_wager,
      pageBuilder: (context, state) => SlideRouteTransition(
        child: CreateWagerScreen(),
        routeName: Routes.create_wager,
      ),
    ),

    GoRoute(
      path: Routes.create_wager_summary,
      pageBuilder: (context, state) => SlideRouteTransition(
        child: WagerSummaryScreen(),
        routeName: Routes.create_wager_summary,
      ),
    ),

    GoRoute(
      path: Routes.wager_created,
      pageBuilder: (context, state) => SlideRouteTransition(
        child: WagerCreatedScreen(),
        routeName: Routes.wager_created,
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
          path: Routes.wager_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: WagersScreen(),
            routeName: Routes.wager_tablet,
          ),
        ),
        GoRoute(
          path: Routes.wallet_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: WalletScreen(),
            routeName: Routes.wallet_tablet,
          ),
        ),
        GoRoute(
          path: Routes.profile_tablet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: ProfileScreen(),
            routeName: Routes.profile_tablet,
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
          path: Routes.wager,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: WagersScreen(),
            routeName: Routes.wager,
          ),
        ),
        GoRoute(
          path: Routes.wallet,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: WalletScreen(),
            routeName: Routes.wallet,
          ),
        ),
        GoRoute(
          path: Routes.profile,
          pageBuilder: (context, state) => SlideRouteTransition(
            child: ProfileScreen(),
            routeName: Routes.profile,
          ),
        ),
      ],
    ),
  ],
);
