import 'package:flutter/material.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/core/constants/assets.dart';

class FundWalletDialog extends StatefulWidget {
  final VoidCallback? onFund;
  final VoidCallback? onClose;

  const FundWalletDialog({
    Key? key,
    this.onFund,
    this.onClose,
  }) : super(key: key);

  @override
  State<FundWalletDialog> createState() => _FundWalletDialogState();
}

class _FundWalletDialogState extends State<FundWalletDialog> {
  bool showInput = false;
  final TextEditingController amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  Widget _buildMainContent() {
    if (!showInput) {
      return Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            height: 120,
            child: Image.asset(
              'assets/icons/wallet_icon.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(height: 24),
        Material(
          color: Colors.transparent,
          child: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '\$0.00',
              hintStyle: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A).withOpacity(0.5),
              ),
            ),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.starknetImage),
            const SizedBox(width: 4),
            Text(
              '0 Strk',
              style: AppTheme.textSmallMedium.copyWith(
                color: AppColors.blue950,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ScreenLayout.isMobile(context);

    final dialogContent = Container(
      height: 360,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: widget.onClose,
                  child: const Icon(Icons.close, size: 24),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fund Your Wallet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Enter the amount you want to fund your wallet and create wagers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748B),
                ),
              ),
            ),
            _buildMainContent(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    if (!showInput) {
                      setState(() {
                        showInput = true;
                      });
                    } else {
                      widget.onFund?.call();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE0FE10),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Fund',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );

    final wrappedContent = isMobile
        ? dialogContent
        : Container(
            width: 400,
            child: dialogContent,
          );

    return isMobile
        ? Align(
            alignment: Alignment.bottomCenter,
            child: dialogContent,
          )
        : Dialog(
            insetPadding: EdgeInsets.zero,
            child: wrappedContent,
          );
  }
}
