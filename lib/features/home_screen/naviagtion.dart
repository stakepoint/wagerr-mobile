part of '../feature.dart';

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  final Widget child;

  const ScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  ConsumerState<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends ConsumerState<ScaffoldWithNavBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final GoRouter router = GoRouter.of(context);
      ref.read(navigationStateProvider.notifier).updateIndexFromRoute(
          router.routerDelegate.currentConfiguration.fullPath);
    });
  }

  void _onNavigate(String route) {
    ref.read(navigationStateProvider.notifier).updateIndexFromRoute(route);
    GoRouter.of(context).go(route);
  }

  late final List<NavigationItem> _navigationItems = [
    NavigationItem(
      label: 'home'.tr(),
      icon: AppIcons.homeNoneIcon,
      onTap: () {
        _onNavigate(
            ScreenLayout.isTablet(context) ? Routes.home_tablet : Routes.home);
      },
    ),
    NavigationItem(
      label: 'wagers'.tr(),
      icon: AppIcons.homeShakeIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.wager_tablet
            : Routes.wager);
      },
    ),
    NavigationItem(
      label: 'wallet'.tr(),
      icon: AppIcons.walletIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.wallet_tablet
            : Routes.wallet);
      },
    ),
    NavigationItem(
      label: 'profile'.tr(),
      icon: AppIcons.profileIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.profile_tablet
            : Routes.profile);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navigationStateProvider);

    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          _onNavigate(Routes.home);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: currentIndex,
          items: _navigationItems,
          selectedColor: context.primaryButtonColor,
          unselectedColor: AppColors.grayneutral500,
          isVertical: false,
          onIndexChanged: (index) {
            if (ScreenLayout.isTablet(context)) {
              switch (index) {
                case 0:
                  _onNavigate(Routes.home_tablet);
                  break;
                case 1:
                  _onNavigate(Routes.wager_tablet);
                  break;
                case 2:
                  _onNavigate(Routes.wallet_tablet);
                  break;
                case 3:
                  _onNavigate(Routes.profile_tablet);
                  break;
              }
            } else {
              switch (index) {
                case 0:
                  _onNavigate(Routes.home);
                  break;
                case 1:
                  _onNavigate(Routes.wager);
                  break;
                case 2:
                  _onNavigate(Routes.wallet);
                  break;
                case 3:
                  _onNavigate(Routes.profile);
                  break;
              }
            }
          },
        ),
      ),
    );
  }
}
