import 'package:flutter/material.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';

class TabWidget extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const TabWidget({
    super.key,
    required this.controller,
    required this.tabs,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          color: AppColors.baseWhite, borderRadius: BorderRadius.circular(6)),
      child: TabBar(
          dividerColor: AppColors.baseWhite,
          controller: controller,
          tabs: tabs.map((title) => Tab(text: title)).toList(),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.buttonInActiveColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: AppColors.blue950,
          unselectedLabelColor: AppColors.grayCool400,
          labelStyle: AppTheme.textRegularMedium,
          unselectedLabelStyle: AppTheme.textRegularMedium,
          padding: const EdgeInsets.all(2)),
    );
  }
}
