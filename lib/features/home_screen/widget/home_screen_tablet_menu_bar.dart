// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreenTabletMenuBar extends StatefulWidget {
  const HomeScreenTabletMenuBar({
    super.key,
  });

  @override
  State<HomeScreenTabletMenuBar> createState() =>
      _HomeScreenTabletMenuBarState();
}

class _HomeScreenTabletMenuBarState extends State<HomeScreenTabletMenuBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 208,
      color: Colors.black,
      child: Column(
        children: [
          verticalSpace(64),
          SvgPicture.asset(AppIcons.logoIcon),
          verticalSpace(40),
          Container(
            height: 56,
            width: 160,
            decoration: BoxDecoration(
              color: AppColors.green100,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.handshakeIcon),
                SizedBox(width: 12),
                Text(
                  'New Wager',
                  style: AppTheme.textMediumMedium.copyWith(
                    color: AppColors.blue950,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(120),
          _buildNavItem(0, 'Home', AppIcons.homeNoneIcon, Routes.home),
          _buildNavItem(1, 'Waggers', AppIcons.homeShakeIcon, Routes.search),
          _buildNavItem(2, 'Wallet', AppIcons.walletIcon, Routes.profile),
          _buildNavItem(3, 'Profile', AppIcons.profileIcon, Routes.settings),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String icon, String route) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        GoRouter.of(context).go(route);
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.grayCool400.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 20,
              width: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.grayCool400.withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
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
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color:
                    isSelected ? AppColors.green100 : AppColors.grayneutral500,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
