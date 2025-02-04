// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class WagerWidget extends ConsumerWidget {
  const WagerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Container(
      height: _isMobile ? 250 : 239,
      width: _isMobile ? 343 : 696,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.baseWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.ellipseIcon),
              horizontalSpace(5),
              _isMobile
                  ? Text(
                      'inProgress'.tr(),
                      style: AppTheme.bodyMedium14.copyWith(
                        color: AppColors.grayCool400,
                      ),
                    )
                  : Text(
                      'inProgress'.tr(),
                      style: AppTheme.bodyLarge16.copyWith(
                        color: AppColors.grayCool400,
                      ),
                    ),
            ],
          ),
          verticalSpace(12),
          _isMobile
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Will Bitcoin Hit \$100k Before January 31, 2025?",
                    textAlign: TextAlign.center,
                    style: AppTheme.textRegularMedium.copyWith(
                      color: AppColors.blue950,
                    ),
                  ),
                )
              : Text(
                  "Will Bitcoin Hit \$100k Before January 31, 2025?",
                  textAlign: TextAlign.center,
                  style: AppTheme.textMediumMedium.copyWith(
                    color: AppColors.blue950,
                  ),
                ),
          verticalSpace(12),
          Container(
            height: 37,
            width: 116,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: AppColors.grayCool100,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Image.asset(
                    AppIcons.starknetImage,
                    width: 16,
                    height: 16,
                  ),
                  horizontalSpace(2.5),
                  Text(
                    "5 Strk each",
                    style: AppTheme.textSmallMedium.copyWith(
                      color: AppColors.blue950,
                    ),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _userDetails(context),
                _vs(context),
                _userDetails(context),
              ],
            ),
          )
        ],
      ),
    );
  }

//----------------------------------------------- VS ----------------------------------------------- //

  Widget _vs(BuildContext context) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Column(
      children: [
        _isMobile
            ? Text(
                "oneOnOne".tr(),
                style: AppTheme.textTinyNormal.copyWith(
                  color: AppColors.blue950,
                ),
              )
            : Text(
                "oneOnOne".tr(),
                style: AppTheme.bodyMedium14.copyWith(
                  color: AppColors.blue950,
                ),
              ),
        verticalSpace(10),
        SvgPicture.asset(AppIcons.vsIcon)
      ],
    );
  }

//----------------------------------------------- USERDETAILS ----------------------------------------------- //

  Widget _userDetails(BuildContext context) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Column(
      children: [
        Container(
          height: _isMobile ? 56 : 64,
          width: _isMobile ? 56 : 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(AppIcons.userImage),
        ),
        verticalSpace(4),
        _isMobile
            ? Text(
                '@noyi24_7',
                style: AppTheme.textTinyMedium
                    .copyWith(color: context.primaryTextColor),
              )
            : Text(
                '@noyi24_7',
                style: AppTheme.bodyMedium14
                    .copyWith(color: context.primaryTextColor),
              ),
      ],
    );
  }
}
