part of '../feature.dart';

class ScaffoldWithNavBar extends ConsumerStatefulWidget {
  final Widget child;

  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

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
            ScreenLayout.isTablet(context) ? Routes.homeTablet : Routes.home);
      },
    ),
    NavigationItem(
      label: 'wagers'.tr(),
      icon: AppIcons.homeShakeIcon,
      onTap: () {
        _onNavigate(
            ScreenLayout.isTablet(context) ? Routes.wagerTablet : Routes.wager);
      },
    ),
    NavigationItem(
      label: 'wallet'.tr(),
      icon: AppIcons.walletIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.walletTablet
            : Routes.wallet);
      },
    ),
    NavigationItem(
      label: 'profile'.tr(),
      icon: AppIcons.profileIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.profileTablet
            : Routes.profile);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(navigationStateProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (currentIndex != 0) {
          _onNavigate(Routes.home);
          return;
        }
        return;
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
                  _onNavigate(Routes.homeTablet);
                  break;
                case 1:
                  _onNavigate(Routes.wagerTablet);
                  break;
                case 2:
                  _onNavigate(Routes.walletTablet);
                  break;
                case 3:
                  _onNavigate(Routes.profileTablet);
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
