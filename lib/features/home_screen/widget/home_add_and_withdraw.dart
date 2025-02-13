part of '../../feature.dart';

class HomeAddAndWithdraw extends ConsumerWidget {
  const HomeAddAndWithdraw({
    super.key,
  });

  void _showFundWalletDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: context.primaryBackgroundColor,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => FundWalletDialog(),
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
