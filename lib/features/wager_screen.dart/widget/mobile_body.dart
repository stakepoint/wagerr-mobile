import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/features/waggers_screen.dart/active_screen.dart';
import 'package:starkwager/features/waggers_screen.dart/complete_screen.dart';
import 'package:starkwager/features/waggers_screen.dart/pending_screen.dart';
import 'package:starkwager/features/waggers_screen.dart/widget/tab_widget.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class MobileBody extends ConsumerStatefulWidget {
  const MobileBody({super.key});

  @override
  ConsumerState<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends ConsumerState<MobileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        Text(
          'WAGERS'.tr(),
          style: AppTheme.headLineLarge32.copyWith(
            color: AppColors.blue950,
          ),
        ),
        verticalSpace(24),
        TabWidget(
          controller: _tabController,
          tabs: ['Active'.tr(), 'Pending'.tr(), 'Complete'.tr()],
        ),
        verticalSpace(24),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ActiveScreen(),
              PendingScreen(),
              CompleteScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
