import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/home_screen/widget/profile_menu.dart';
import 'package:starkwager/features/wager_screen.dart/active_screen.dart';
import 'package:starkwager/features/wager_screen.dart/complete_screen.dart';
import 'package:starkwager/features/wager_screen.dart/pending_screen.dart';
import 'package:starkwager/features/wager_screen.dart/widget/tab_widget.dart';
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
    final isMobile = ScreenLayout.isMobile(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(20),
        isMobile
            ? Text(
                'WAGERS'.tr(),
                style: AppTheme.headLineLarge32.copyWith(
                  color: AppColors.blue950,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: AppTheme.headLineLarge32.copyWith(
                      color: AppColors.blue950,
                    ),
                  ),
                  Row(
                    children: [
                      ProfileMenu(),
                      horizontalSpace(24),
                      SvgPicture.asset(
                        AppIcons.notificationIcon,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
        isMobile ? verticalSpace(24) : verticalSpace(120),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 280),
                    child: TabWidget(
                      controller: _tabController,
                      tabs: ['Active'.tr(), 'Pending'.tr(), 'Complete'.tr()],
                    ),
                  )
                : TabWidget(
                    controller: _tabController,
                    tabs: ['Active'.tr(), 'Pending'.tr(), 'Complete'.tr()],
                  )
            : TabWidget(
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
