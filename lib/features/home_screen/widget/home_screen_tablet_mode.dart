import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/features/home_screen/widget/home_screen_body.dart';
import 'package:starkwager/features/home_screen/widget/profile_menu.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreenTabletMode extends ConsumerWidget {
  const HomeScreenTabletMode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(48),
        Row(
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
        verticalSpace(120),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 184),
          child: HomeScreenBody(),
        ),
      ],
    );
  }
}
