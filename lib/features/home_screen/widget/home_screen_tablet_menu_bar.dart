// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/features/wager_screen.dart/provider/navigation_provider.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreenTabletMenuBar extends ConsumerStatefulWidget {
  final Widget child;

  const HomeScreenTabletMenuBar({
    required this.child,
    super.key,
  });

  @override
  ConsumerState<HomeScreenTabletMenuBar> createState() =>
      _HomeScreenTabletMenuBarState();
}

class _HomeScreenTabletMenuBarState
    extends ConsumerState<HomeScreenTabletMenuBar> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final GoRouter router = GoRouter.of(context);
      ref.read(navigationStateProvider.notifier).updateIndexFromRoute(
          router.routerDelegate.currentConfiguration.fullPath);
    });
  }

  void _onNavigate(int index) {
    String route;
    switch (index) {
      case 0:
        route = Routes.home_tablet;
        break;
      case 1:
        route = Routes.wagger_tablet;
        break;
      case 2:
        route = Routes.wallet_tablet;
        break;
      case 3:
        route = Routes.profile_tablet;
        break;
      default:
        route = Routes.home_tablet;
    }

    ref.read(navigationStateProvider.notifier).updateIndex(index);
    GoRouter.of(context).go(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSideBar(),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Widget _buildSideBar() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 208,
      color: Colors.black,
      child: Column(
        children: [
          verticalSpace(64),
          SvgPicture.asset(AppIcons.logoIcon),
          verticalSpace(40),
          _buildNewWagerButton(),
          verticalSpace(120),
          _buildNavItems(isVertical: true),
        ],
      ),
    );
  }

  Widget _buildNewWagerButton() {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.create_wager);
      },
      child: Container(
        height: 56,
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.green100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.handshakeIcon),
            const SizedBox(width: 12),
            Text(
              'newWager'.tr(),
              style: AppTheme.textMediumMedium.copyWith(
                color: AppColors.blue950,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItems({required bool isVertical}) {
    final items = [
      {
        'index': 0,
        'label': 'home'.tr(),
        'icon': AppIcons.homeNoneIcon,
      },
      {
        'index': 1,
        'label': 'wagers'.tr(),
        'icon': AppIcons.homeShakeIcon,
      },
      {
        'index': 2,
        'label': 'wallet'.tr(),
        'icon': AppIcons.walletIcon,
      },
      {
        'index': 3,
        'label': 'profile'.tr(),
        'icon': AppIcons.profileIcon,
      },
    ];

    return isVertical
        ? Column(
            children: items
                .map((item) => _buildNavItem(
                      item['index'] as int,
                      item['label'] as String,
                      item['icon'] as String,
                    ))
                .toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items
                .map((item) => _buildNavItem(
                      item['index'] as int,
                      item['label'] as String,
                      item['icon'] as String,
                    ))
                .toList(),
          );
  }

  Widget _buildNavItem(int index, String label, String icon) {
    final currentIndex = ref.watch(navigationStateProvider);
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => _onNavigate(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 32,
            width: 64,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.grayCool400.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              height: 32,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected ? AppColors.grayCool800 : Colors.transparent,
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                  color: isSelected
                      ? AppColors.green100
                      : AppColors.grayneutral500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.green100 : AppColors.grayneutral500,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          verticalSpace(12),
        ],
      ),
    );
  }
}
