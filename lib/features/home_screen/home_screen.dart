// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/home_screen/widget/home_screen_app_bar.dart';
import 'package:starkwager/features/home_screen/widget/home_screen_body.dart';
import 'package:starkwager/features/home_screen/widget/home_screen_tablet_mode.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isMobile ? HomeScreenAppBar() : null,
      backgroundColor: context.secondaryTextColor,
      floatingActionButton:
          isMobile || isPortrait ? _floatingActionButton(context) : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            final double maxWidthTablet = AppValues.width1440;
            return isMobile
                ? ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(48),
                          HomeScreenBody(),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidthTablet),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 80),
                      child: HomeScreenTabletMode(),
                    ),
                  );
          },
        ),
      ),
    );
  }

//----------------------------------------------- FLOATINGACTIONBUTTON ----------------------------------------------- //

  Widget _floatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(Routes.create_wager);
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
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          // spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.handshakeIcon),
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
}
