part of '../../feature.dart';

class WalletScreenBody extends ConsumerWidget {
  const WalletScreenBody({Key? key}) : super(key: key);

  void _showFundWalletDialog(BuildContext context) {
    final isMobile = context.isMobile;
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
    final bool isMobile = context.isMobile;

    return Column(
      children: [
        ContractAddress(isTablet: !isMobile),
        const SizedBox(height: 8),
        // Stark amount with action buttons on tablet
        StarkAmount(
          isTablet: !isMobile,
          onAddMoney: () => _showFundWalletDialog(context),
          onWithdraw: () {},
        ),
        const SizedBox(height: 16),
        if (isMobile) HomeAddAndWithdraw(),
        isMobile ? const SizedBox(height: 48) : const SizedBox(height: 40),
        RecentTransactions(isTablet: !isMobile),
      ],
    );
  }
}
