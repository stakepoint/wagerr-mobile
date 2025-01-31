import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final FocusNode _focusNode = FocusNode();

  String get _dialogText => showInput
      ? 'Enter the amount you want to fund your wallet and create wagers.'
      : 'To be able to create wagers you need to fund your wallet with Strk.';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && mounted) {
      setState(() {}); // Ensures bottom sheet resizes dynamically
    }
  }

  Widget _buildMainContent() {
    if (!showInput) {
      return Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            height: 100,
            child:
                SvgPicture.asset(AppIcons.fundWalletIcon, fit: BoxFit.contain),
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
            focusNode: _focusNode,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
            ],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '\$0.00',
              hintStyle: const TextStyle(
                fontFamily: 'General Sans Variable',
                fontSize: 48,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9DA4AE), // Updated color
              ),
            ),
            style: const TextStyle(
              fontFamily: 'General Sans Variable',
              fontSize: 48,
              height: 1.2,
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
    final viewInsets = MediaQuery.of(context).viewInsets.bottom;

    final dialogContent = AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding:
          EdgeInsets.only(bottom: viewInsets), // Adjusts when keyboard appears
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMobile)
            Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 12),
              child: GestureDetector(
                onTap: widget.onClose,
                child: const Icon(Icons.close, size: 24),
              ),
            ),
          ),
          const Text(
            'Fund Your Wallet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _dialogText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16, // Now font size changes will take effect
                color: Color(0xFF64748B),
              ),
            ),
          ),
          _buildMainContent(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (!showInput) {
                    setState(() {
                      showInput = true;
                    });
                    Future.delayed(const Duration(milliseconds: 100), () {
                      _focusNode.requestFocus();
                    });
                  } else {
                    widget.onFund?.call();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0FE10),
                  foregroundColor: Colors.black,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
          const SizedBox(height: 16),
        ],
      ),
    );

    if (isMobile) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: DraggableScrollableSheet(
          initialChildSize: viewInsets > 0 ? 0.7 : 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: dialogContent,
              ),
            );
          },
        ),
      );
    }

    // **Tablet UI**
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 420, // Fixed width
        height: 400, // Fixed height (Adjust if needed)
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: dialogContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
