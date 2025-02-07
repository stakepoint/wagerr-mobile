part of '../../feature.dart';

class CurrencyTextInputFormatter extends TextInputFormatter {
  CurrencyTextInputFormatter({
    this.maxDigits = 10,
  });

  final int maxDigits;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    if (oldValue.text == '\$' && newValue.text.isEmpty) {
      return const TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }

    String filtered = newValue.text.replaceAll(RegExp(r'[^\d.]'), '');

    if (filtered.contains('.')) {
      List<String> parts = filtered.split('.');
      if (parts[0].length > maxDigits) {
        parts[0] = parts[0].substring(0, maxDigits);
      }
      filtered = parts.join('.');
    } else if (filtered.length > maxDigits) {
      filtered = filtered.substring(0, maxDigits);
    }

    int decimalCount = '.'.allMatches(filtered).length;
    if (decimalCount > 1) {
      List<String> parts = filtered.split('.');
      filtered = parts[0] + '.' + parts.sublist(1).join('');
    }

    if (filtered.contains('.')) {
      List<String> parts = filtered.split('.');

      if (parts[1].length > 2) {
        parts[1] = parts[1].substring(0, 2);
      }
      filtered = parts[0] + '.' + parts[1];
    }

    if (filtered.startsWith('.')) {
      filtered = '0' + filtered;
    }

    String withCommas = '';
    if (filtered.contains('.')) {
      List<String> parts = filtered.split('.');
      withCommas = _addThousandSeparator(parts[0]) + '.' + parts[1].padRight(2, '0');
    } else {
      withCommas = _addThousandSeparator(filtered) + '.00';
    }

    String formatted = '\$' + withCommas;

    int cursorPosition;
    int difference = formatted.length - oldValue.text.length;
    cursorPosition = newValue.selection.start + difference;
    
    if (cursorPosition < 0) {
      cursorPosition = 0;
    } else if (cursorPosition > formatted.length) {
      cursorPosition = formatted.length;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  String _addThousandSeparator(String value) {
    value = value.replaceAll(',', '');
    
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return value.replaceAllMapped(reg, mathFunc);
  }
}

@override
TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, TextEditingValue newValue) {
  String text = newValue.text;

  if (!text.startsWith("\$")) {
    text = "\$${text.replaceAll("\$", "")}";
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
    super.key,
    this.onFund,
    this.onClose,
  });

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
            inputFormatters: [CurrencyTextInputFormatter(maxDigits: 10)], 
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '\$0.00',
                hintStyle: AppTheme.of(context).headingMobileH1.copyWith(
                    color: context.textHintColor,
                ),
            ),
            style: AppTheme.of(context).headingMobileH1),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.starknetImage),
            const SizedBox(width: 4),
            Text('0 Strk', style: AppTheme.of(context).textSmallMedium),
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
                color: context.containerColor,
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
          Text('fundYourWallet'.tr(),
              style: AppTheme.of(context).titleExtraLarge24),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(_dialogText,
                textAlign: TextAlign.center,
                style: AppTheme.of(context)
                    .bodyLarge16
                    .copyWith(color: context.subTitleTextColor)),
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
                  backgroundColor: context.primaryButtonColor,
                  foregroundColor: context.primaryTextColor,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'fundButton'.tr(),
                  style: AppTheme.of(context).bodyExtraLarge18.copyWith(
                        fontWeight: FontWeight.w500,
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
            decoration: BoxDecoration(
              color: context.containerColor,
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
