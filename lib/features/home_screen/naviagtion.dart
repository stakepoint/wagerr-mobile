// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/home_screen/widget/home_bottom_navigation.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  void _onNavigate(String route) {
    setState(() {
      switch (route) {
        case Routes.home:
        case Routes.home_tablet:
          _currentIndex = 0;
          break;
        case Routes.wagger:
        case Routes.wagger_tablet:
          _currentIndex = 1;
          break;
        case Routes.profile:
        case Routes.profile_tablet:
          _currentIndex = 2;
          break;
        case Routes.wallet:
        case Routes.wallet_tablet:
          _currentIndex = 3;
          break;
      }
    });
    GoRouter.of(context).go(route);
  }

  late final List<NavigationItem> _navigationItems = [
    NavigationItem(
      label: 'Home',
      icon: AppIcons.homeNoneIcon,
      onTap: () {
        _onNavigate(
            ScreenLayout.isTablet(context) ? Routes.home_tablet : Routes.home);
      },
    ),
    NavigationItem(
      label: 'Wagers',
      icon: AppIcons.homeShakeIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.wagger_tablet
            : Routes.wagger);
      },
    ),
    NavigationItem(
      label: 'Wallet',
      icon: AppIcons.walletIcon,
      onTap: () {
        _onNavigate(ScreenLayout.isTablet(context)
            ? Routes.wallet_tablet
            : Routes.wallet);
      },
    ),
    NavigationItem(
      label: 'Profile',
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
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          _onNavigate(Routes.home);
          GoRouter.of(context).go(Routes.home);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: _currentIndex,
          items: _navigationItems,
          selectedColor: AppColors.green100,
          unselectedColor: AppColors.grayneutral500,
          isVertical: false,
          onIndexChanged: (index) {
            setState(() {
              _currentIndex = index;
            });

            if (ScreenLayout.isTablet(context)) {
              switch (index) {
                case 0:
                  _onNavigate(Routes.home_tablet);
                  break;
                case 1:
                  _onNavigate(Routes.wagger_tablet);
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
                  _onNavigate(Routes.wagger);
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
