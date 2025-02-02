import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeActionButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final Color? textColor;

  const HomeActionButton({
    super.key,
    required this.text,
    required this.iconPath,
    this.onTap,
    this.backgroundColor = AppColors.baseWhite,
    this.iconBackgroundColor = AppColors.grayCool100,
    this.textColor = AppColors.blue950,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenLayout.isMobile(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isMobile ? 56.0 : 60.0,
        width: 164,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpace(6),
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: iconBackgroundColor,
              ),
              child: Center(
                child: SvgPicture.asset(iconPath),
              ),
            ),
            horizontalSpace(8),
            Text(
              text,
              style: AppTheme.of(context).textSmallMedium.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
