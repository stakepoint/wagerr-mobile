part of '../../feature.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.isMobile) {
        _showBottomSheet(context);
      } else {
        _showDialog(context);
      }
    });
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

  void _showBottomSheet(BuildContext context) async {
    final response = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                color: context.containerColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: _buildContent(setModalState),
            );
          },
        );
      },
    );
    if (response == null) {
      popOverlay();
    }
  }

  void _showDialog(BuildContext context) async {
    final response = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
              minWidth: 420,
              maxWidth: 420,
            ),
            child: ClipRect(
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: _buildContent(setModalState),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
    if (response == null) {
      popOverlay();
    }
  }

  void popOverlay() {
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildContent(StateSetter setModalState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (context.isMobile)
          Container(
            width: 32,
            height: 4,
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, top: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(true);
                widget.onClose?.call();
              },
              child: const Icon(Icons.close, size: 24),
            ),
          ),
        ),
        Text('fundYourWallet'.tr(),
            style: AppTheme.of(context).titleExtraLarge24),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            _dialogText,
            textAlign: TextAlign.center,
            style: AppTheme.of(context)
                .bodyLarge16
                .copyWith(color: context.subTitleTextColor),
          ),
        ),
        _buildMainContent(setModalState),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 24,
            right: 24,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                if (!showInput) {
                  setModalState(() {
                    showInput = true;
                  });
                  Future.delayed(const Duration(milliseconds: 100), () {
                    _focusNode.requestFocus();
                  });
                } else {
                  Navigator.of(context).pop(true);
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
    );
  }

  Widget _buildMainContent(StateSetter setModalState) {
    if (!showInput) {
      return Column(
        children: [
          verticalSpace(24),
          SizedBox(
            height: 100,
            child:
                SvgPicture.asset(AppIcons.fundWalletIcon, fit: BoxFit.contain),
          ),
          verticalSpace(32),
        ],
      );
    }
    return Column(
      children: [
        verticalSpace(24),
        Material(
          color: Colors.transparent,
          child: TextField(
            controller: amountController,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [CurrencyTextInputFormatter()],
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '\$0.00',
              hintStyle: AppTheme.of(context)
                  .headingMobileH1
                  .copyWith(color: context.textHintColor),
            ),
            style: AppTheme.of(context).headingMobileH1,
          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.starknetImage),
            const SizedBox(width: 4),
            Text('0 Strk', style: AppTheme.of(context).textSmallMedium),
          ],
        ),
        verticalSpace(32),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
