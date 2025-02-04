import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text =
        newValue.text.replaceAll("\$", ""); // Remove any "$" before adding it

    if (text.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    text = "\$" + text;

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

@override
TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue) {
  String text = newValue.text;

  if (!text.startsWith("\$")) {
    text = "\$" + text.replaceAll("\$", "");
  }

  return TextEditingValue(
    text: text,
    selection: TextSelection.collapsed(offset: text.length),
  );
}

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

  String get _dialogText =>
      showInput ? 'enterAmountDescription'.tr() : 'fundWalletDescription'.tr();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    amountController.text = "";
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
      setState(() {});
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
          const SizedBox(height: 32),
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
            inputFormatters: [CurrencyTextInputFormatter()],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '\$0.00',
              hintStyle: AppTheme.headingMobileH1.copyWith(
                color: AppColors.grayCool400,
              ),
            ),
            style: AppTheme.headingMobileH1.copyWith(
              color: AppColors.blue950,
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
    final mediaQuery = MediaQuery.of(context);
    final keyboardHeight = mediaQuery.viewInsets.bottom;

    final dialogContent = AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isMobile)
            Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(top: 8, bottom: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24, top: 16),
              child: GestureDetector(
                onTap: widget.onClose,
                child: const Icon(Icons.close, size: 24),
              ),
            ),
          ),
          Text(
            'fundYourWallet'.tr(),
            style: AppTheme.titleExtraLarge24.copyWith(
              color: AppColors.blue950,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _dialogText,
              textAlign: TextAlign.center,
              style: AppTheme.bodyLarge16.copyWith(
                color: AppColors.grayCool800,
              ),
            ),
          ),
          _buildMainContent(),
          Padding(
            padding: EdgeInsets.only(
              bottom: keyboardHeight > 0 ? 16 : 0,
              left: 24,
              right: 24,
            ),
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
                  backgroundColor: AppColors.buttonColor,
                  foregroundColor: AppColors.blue950,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'fundButton'.tr(),
                  style: AppTheme.titleMedium18.copyWith(
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
      final sheetHeight = keyboardHeight > 0
          ? MediaQuery.of(context).size.height * 0.6
          : MediaQuery.of(context).size.height * 0.48;
      return MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: sheetHeight,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SingleChildScrollView(
              child: dialogContent,
            ),
          ),
        ),
      );
    }

    // ========== Tablet Section ==========
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final maxHeightPercentage =
        isLandscape ? 0.5 : 0.38; // 50% in landscape, 40% in portrait

    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * maxHeightPercentage,
          minWidth: 420,
          maxWidth: 420,
        ),
        child: ClipRect(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: dialogContent, // No extra padding here
          ),
        ),
      ),
    );
  }
}
