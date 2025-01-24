// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/assets.dart';
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
          _currentIndex = 0;
          break;
        case Routes.search:
          _currentIndex = 1;
          break;
        case Routes.profile:
          _currentIndex = 2;
          break;
        case Routes.settings:
          _currentIndex = 3;
          break;
      }
    });
  }

  late final List<NavigationItem> _navigationItems = [
    NavigationItem(
      label: 'Home',
      icon: AppIcons.homeNoneIcon,
      onTap: () {
        _onNavigate(Routes.home);
        GoRouter.of(context).go(Routes.home);
      },
    ),
    NavigationItem(
      label: 'Waggers',
      icon: AppIcons.homeShakeIcon,
      onTap: () {
        _onNavigate(Routes.search);
        GoRouter.of(context).go(Routes.search);
      },
    ),
    NavigationItem(
      label: 'Wallet',
      icon: AppIcons.walletIcon,
      onTap: () {
        _onNavigate(Routes.profile);
        GoRouter.of(context).go(Routes.profile);
      },
    ),
    NavigationItem(
      label: 'Profile',
      icon: AppIcons.profileIcon,
      onTap: () {
        _onNavigate(Routes.settings);
        GoRouter.of(context).go(Routes.settings);
      },
    ),
  ];

//----------------------------------------------- Tablet Shell Route ----------------------------------------------- //

  late final List<NavigationItem> _tabletPortraitNavigationItems = [
    NavigationItem(
      label: 'Home',
      icon: AppIcons.homeNoneIcon,
      onTap: () {
        _onNavigate(Routes.home_tablet_potriate);
        GoRouter.of(context).go(Routes.home_tablet_potriate);
      },
    ),
    NavigationItem(
      label: 'Waggers',
      icon: AppIcons.homeShakeIcon,
      onTap: () {
        _onNavigate(Routes.search_tablet_potriate);
        GoRouter.of(context).go(Routes.search_tablet_potriate);
      },
    ),
    NavigationItem(
      label: 'Wallet',
      icon: AppIcons.walletIcon,
      onTap: () {
        _onNavigate(Routes.profile_tablet_potriate);
        GoRouter.of(context).go(Routes.profile_tablet_potriate);
      },
    ),
    NavigationItem(
      label: 'Profile',
      icon: AppIcons.profileIcon,
      onTap: () {
        _onNavigate(Routes.settings_tablet_potriate);
        GoRouter.of(context).go(Routes.settings_tablet_potriate);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return WillPopScope(
      onWillPop: isLandscape
          ? () async {
              if (_currentIndex != 0) {
                _onNavigate(Routes.home_tablet_potriate);
                GoRouter.of(context).go(Routes.home_tablet_potriate);
                return false;
              }
              return true;
            }
          : () async {
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
          items:
              isLandscape ? _navigationItems : _tabletPortraitNavigationItems,
          selectedColor: AppColors.green100,
          unselectedColor: AppColors.grayneutral500,
          isVertical: false,
          onIndexChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
