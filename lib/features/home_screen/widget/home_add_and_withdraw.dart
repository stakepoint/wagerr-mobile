import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/features/home_screen/widget/home_action_button.dart';
import 'package:starkwager/features/fund_wallet/widgets/fund_wallet_dialog.dart';

class HomeAddAndWithdraw extends ConsumerWidget {
  const HomeAddAndWithdraw({
    super.key,
  });

  void _showFundWalletDialog(BuildContext context) {
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
