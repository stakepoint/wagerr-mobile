import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/utils/ui_widgets.dart';
import '../../../theme/app_theme.dart';

class InstalledWalletWidget extends ConsumerWidget {
  final String title;
  final Widget icon;
  final bool isInstalled;
  final Function() onTap;

  const InstalledWalletWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.isInstalled,
    required this.onTap
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: ()=> onTap(),
      child: Container(
        height: AppValues.height56,
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(AppValues.radius16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding24, vertical: AppValues.padding12),
          child: Row(
            children: [
              icon,
              horizontalSpace(AppValues.padding10),
              Text(
                isInstalled ? title : '${'install'.tr()} $title',
                style: AppTheme.titleMedium18.copyWith(
                    color: context.primaryTextColor, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Visibility(
                visible: isInstalled,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.baseWhite,
                    border: Border.all(
                        width: AppValues.width1,
                        color: AppColors.grayCool200
                    ),
                    borderRadius: BorderRadius.circular(AppValues.radius4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppValues.padding8),
                    child: Text(
                      'installed'.tr(),
                      style: AppTheme.bodySmall12.copyWith(
                          color: context.primaryTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
