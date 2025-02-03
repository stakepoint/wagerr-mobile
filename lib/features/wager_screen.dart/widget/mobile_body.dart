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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(25),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'waggers'.tr(),
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
                        ),
                      ],
                    ),
                  )
                : Text(
                    'waggers'.tr(),
                    style: AppTheme.headLineLarge32.copyWith(
                      color: AppColors.blue950,
                    ),
                  )
            : Text(
                'waggers'.tr(),
                style: AppTheme.headLineLarge32.copyWith(
                  color: AppColors.blue950,
                ),
              ),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? verticalSpace(100)
                : verticalSpace(44)
            : verticalSpace(24),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 270),
                    child: TabWidget(
                      controller: _tabController,
                      tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
                    ),
                  )
                : TabWidget(
                  controller: _tabController,
                  tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
                )
            : TabWidget(
              controller: _tabController,
              tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
            ),
        verticalSpace(24),
        Expanded(
          child: Padding(
            padding: ScreenLayout.isTablet(context)
                ? isPortrait
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : EdgeInsets.zero
                : EdgeInsets.zero,
            child: TabBarView(
              controller: _tabController,
              children: const [
                ActiveScreen(),
                PendingScreen(),
                CompleteScreen(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
