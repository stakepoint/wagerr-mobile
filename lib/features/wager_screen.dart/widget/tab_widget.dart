import 'package:flutter/material.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
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
          color: context.containerColor, borderRadius: BorderRadius.circular(6)),
      child: TabBar(
          dividerColor: context.containerColor,
          controller: controller,
          tabs: tabs.map((title) => Tab(text: title)).toList(),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.primaryButtonColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: context.primaryTextColor,
          unselectedLabelColor: context.textHintColor,
          labelStyle: AppTheme.of(context).textRegularMedium,
          unselectedLabelStyle: AppTheme.of(context).textRegularMedium,
          padding: const EdgeInsets.all(2)),
    );
  }
}
