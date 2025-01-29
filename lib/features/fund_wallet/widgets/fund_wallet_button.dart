import 'package:flutter/material.dart';
import 'fund_wallet_dialog.dart';

class FundWalletButton extends StatelessWidget {
  final VoidCallback? onFund;

  const FundWalletButton({
    Key? key,
    this.onFund,
  }) : super(key: key);

  void _showFundWalletDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => FundWalletDialog(
        onFund: onFund,
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showFundWalletDialog(context),
      child: const Text('Fund Wallet'),
    );
  }
}
