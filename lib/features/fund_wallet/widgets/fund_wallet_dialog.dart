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

  Future<void> _showBottomSheet(BuildContext context) async {
    final response = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildBottomSheetContent(),
    );
    _handleResponse(response);
  }

  Future<void> _showDialog(BuildContext context) async {
    final response = await showDialog(
      context: context,
      builder: (context) => _buildDialogContent(),
    );
    _handleResponse(response);
  }

  void _handleResponse(dynamic response) {
    if (response == null && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildBottomSheetContent() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setModalState) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: context.containerColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: _buildContent(setModalState),
        );
      },
    );
  }

  Widget _buildDialogContent() {
    return Dialog(
      backgroundColor: context.containerColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 420,
          maxWidth: 420,
        ),
        child: ClipRect(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return _buildContent(setModalState);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(StateSetter setModalState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(AppValues.height15),
        _buildHeader(),
        _buildDescription(),
        _buildMainContent(setModalState),
        _buildActionButton(setModalState),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: SizedBox()),
        Text('fundYourWallet'.tr(),
            textAlign: TextAlign.center,
            style: AppTheme.of(context).titleExtraLarge24),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: SvgPicture.asset(AppIcons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        _dialogText,
        textAlign: TextAlign.center,
        style: AppTheme.of(context)
            .bodyLarge16
            .copyWith(color: context.subTitleTextColor),
      ),
    );
  }

  Widget _buildMainContent(StateSetter setModalState) {
    return showInput ? _buildInputContent() : _buildIconContent();
  }

  Widget _buildIconContent() {
    return Column(
      children: [
        verticalSpace(24),
        SizedBox(
          height: 100,
          child: SvgPicture.asset(AppIcons.fundWalletIcon, fit: BoxFit.contain),
        ),
        verticalSpace(32),
      ],
    );
  }

  Widget _buildInputContent() {
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

  Widget _buildActionButton(StateSetter setModalState) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
        left: 24,
        right: 24,
      ),
      child: PrimaryButton(
          buttonText: 'fund'.tr(),
          onPressed: () {
            if (!showInput) {
              setModalState(() => showInput = true);
              Future.delayed(const Duration(milliseconds: 100), () {
                _focusNode.requestFocus();
              });
            } else {
              context.pop();
              widget.onFund?.call();
            }
          },
          isActive: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
