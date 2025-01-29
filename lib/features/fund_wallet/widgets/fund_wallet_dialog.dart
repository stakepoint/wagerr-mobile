import 'package:flutter/material.dart';

class FundWalletDialog extends StatelessWidget {
  final VoidCallback? onFund;
  final VoidCallback? onClose;

  const FundWalletDialog({
    Key? key,
    this.onFund,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.only(top: 16), // Adjust top padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button at the top right
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16), // Right padding
                child: GestureDetector(
                  onTap: onClose,
                  child: const Icon(Icons.close, size: 24),
                ),
              ),
            ),

            const SizedBox(height: 8), // Space below the close button

            // Title
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

            // Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'To be able to create wagers you need to fund your wallet with Strk.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748B),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Wallet Icon
            SizedBox(
              height: 120,
              child: Image.asset(
                'assets/icons/wallet_icon.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 24),

            // Fund Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: onFund,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
