part of '../../feature.dart';

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
