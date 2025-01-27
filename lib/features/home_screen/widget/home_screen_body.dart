import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/home_screen/widget/home_action_button.dart';
import 'package:starkwager/features/home_screen/widget/home_add_and_withdraw.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Column(
      children: [
        _isMobile
            ? _mobileContractAddress(context)
            : _tabletContractAddress(context),
        verticalSpace(8),
        _isMobile ? _mobileStarkAmount() : _tabletStarkAmount(),
        verticalSpace(16),
        _isMobile ? HomeAddAndWithdraw() : SizedBox(),
        _isMobile ? verticalSpace(48) : verticalSpace(40),
        _isMobile ? _mobileNoWagger() : _tabletNoWagger(),
      ],
    );
  }

//----------------------------------------------- MOBILENOWAGGER ----------------------------------------------- //

  Widget _mobileNoWagger() {
    return Container(
      height: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.baseWhite,
      ),
      child: Row(
        // spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          horizontalSpace(16),
          SvgPicture.asset(AppIcons.noWaggerIcon),
          Text(
            'nowagerscreatedyet'.tr(),
            style: AppTheme.titleSmall16.copyWith(
              color: AppColors.grayCool400,
            ),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------- MOBILENOWAGGER ----------------------------------------------- //

  Widget _tabletNoWagger() {
    return Container(
      height: 175,
      width: 696,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.baseWhite,
      ),
      child: Column(
        // spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.noWaggerIcon, width: 88, height: 88),
          Text(
            'nowagerscreatedyet'.tr(),
            style: AppTheme.textMediumNormal.copyWith(
              color: AppColors.grayCool400,
            ),
          ),
        ],
      ),
    );
  }

//----------------------------------------------- MOBILESTARKAMOUNT ----------------------------------------------- //

  Widget _mobileStarkAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$0.00',
          style: AppTheme.headingMobileH1.copyWith(
            color: AppColors.blue950,
          ),
        ),
        Row(
          children: [
            Image.asset(AppIcons.starknetImage),
            horizontalSpace(4),
            Text(
              '${'0'} Strk',
              style: AppTheme.textSmallMedium.copyWith(
                color: AppColors.blue950,
              ),
            ),
          ],
        ),
      ],
    );
  }

//----------------------------------------------- TABLETSTARKAMOUNT ----------------------------------------------- //

  Widget _tabletStarkAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 8,
          children: [
            Text(
              '\$0.00',
              style: AppTheme.headingMobileH1.copyWith(
                color: AppColors.blue950,
              ),
            ),
            Row(
              children: [
                Image.asset(AppIcons.starknetImage),
                horizontalSpace(4),
                Text(
                  '${'0'} Strk',
                  style: AppTheme.textSmallMedium.copyWith(
                    color: AppColors.blue950,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            // spacing: 16,
            children: [
              HomeActionButton(
                text: 'addMoney'.tr(),
                iconPath: AppIcons.addIcon,
                onTap: () {},
              ),
              HomeActionButton(
                text: 'withdraw'.tr(),
                iconPath: AppIcons.withdrawIcon,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

//----------------------------------------------- MOBILECONTRACTADDRESS ----------------------------------------------- //

  Widget _mobileContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.bodyMedium14.copyWith(
            color: AppColors.grayCool400,
          ),
        ),
        Container(
          height: 29,
          width: 151,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.baseWhite,
          ),
          child: Row(
            // spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0x400e44000...',
                style: AppTheme.textSmallMedium
                    .copyWith(color: context.primaryTextColor),
              ),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }

//----------------------------------------------- TABLETCONTRACTADDRESS ----------------------------------------------- //

  Widget _tabletContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.titleSmall16.copyWith(
            color: AppColors.grayCool400,
          ),
        ),
        Container(
          height: 29,
          width: 151,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.baseWhite,
          ),
          child: Row(
            // spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0x400e44000...',
                style: AppTheme.textRegularMedium
                    .copyWith(color: context.primaryTextColor),
              ),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }
}
