import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/home_screen/widget/home_action_button.dart';
import 'package:starkwager/features/fund_wallet/widgets/fund_wallet_dialog.dart';
import 'package:starkwager/features/home_screen/widget/home_add_and_withdraw.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({
    super.key,
  });

  void _showFundWalletDialog(BuildContext context) {
    final isMobile = ScreenLayout.isMobile(context);

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => FundWalletDialog(
          onClose: () => Navigator.of(context).pop(),
          onFund: () {
            // Add your funding logic here
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => FundWalletDialog(
          onClose: () => Navigator.of(context).pop(),
          onFund: () {
            // Add your funding logic here
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Column(
      children: [
        _isMobile
            ? _mobileContractAddress(context)
            : _tabletContractAddress(context),
        verticalSpace(8),
        _isMobile ? _mobileStarkAmount() : _tabletStarkAmount(context),
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
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          horizontalSpace(16),
          SvgPicture.asset(AppIcons.noWaggerIcon),
          Text(
            'nowagerscreatedyet'.tr(),
            style: AppTheme.of(context).bodyLarge16.copyWith(
              color: AppColors.grayCool400,
            ),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------- MOBILE_NO_WAGER ----------------------------------------------- //

  Widget _tabletNoWager(BuildContext context) {
    return Container(
      height: 175,
      width: 696,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.baseWhite,
      ),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.noWaggerIcon, width: 88, height: 88),
          Text(
            'nowagerscreatedyet'.tr(),
            style: AppTheme.of(context).textMediumNormal.copyWith(
              color: AppColors.grayCool400,
            ),
          ),
        ],
      ),
    );
  }

//----------------------------------------------- MOBILE_STARK_AMOUNT ----------------------------------------------- //

  Widget _mobileStarkAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$0.00',
          style: AppTheme.of(context).headingMobileH1
        ),
        Row(
          children: [
            Image.asset(AppIcons.starknetImage),
            horizontalSpace(4),
            Text(
              '${'0'} Strk',
              style: AppTheme.of(context).textSmallMedium
            ),
          ],
        ),
      ],
    );
  }

//----------------------------------------------- TABLET_STARK_AMOUNT ----------------------------------------------- //

  Widget _tabletStarkAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text(
              '\$0.00',
              style: AppTheme.of(context).headingMobileH1
            ),
            Row(
              children: [
                Image.asset(AppIcons.starknetImage),
                horizontalSpace(4),
                Text(
                  '${'0'} Strk',
                  style: AppTheme.of(context).textSmallMedium
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            spacing: 16,
            children: [
              HomeActionButton(
                text: 'addMoney'.tr(),
                iconPath: AppIcons.addIcon,
                onTap: () => _showFundWalletDialog(context),
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

//----------------------------------------------- MOBILE_CONTRACT_ADDRESS ----------------------------------------------- //

  Widget _mobileContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.of(context).bodyMedium14.copyWith(
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
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0x400e44000...',
                style: AppTheme.of(context).textSmallMedium
              ),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }

//----------------------------------------------- TABLET_CONTRACT_ADDRESS ----------------------------------------------- //

  Widget _tabletContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.of(context).bodyLarge16.copyWith(
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
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0x400e44000...',
                style: AppTheme.of(context).textRegularMedium
              ),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }
}
