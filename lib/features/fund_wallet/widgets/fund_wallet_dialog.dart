// ignore_for_file: must_be_immutable
part of '../../feature.dart';

class FundWallet extends ConsumerStatefulWidget {
  FundWallet({
    super.key,
    required this.showInput,
    this.isDialog = false,
    this.onClose,
    this.onFund,
  });

  bool showInput = false;
  final bool isDialog;
  final VoidCallback? onClose;
  final VoidCallback? onFund;

  @override
  ConsumerState<FundWallet> createState() => _FundWalletState();
}

class _FundWalletState extends ConsumerState<FundWallet> {
  final TextEditingController amountController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String get _dialogText =>
      widget.showInput ? 'enterAmountDescription'.tr() : 'fundWalletDescription'.tr();

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

  @override
  Widget build(BuildContext context) {
    if (widget.isDialog) {
      return _buildDialog(context);
    } else {
      return _buildBottomSheet(context);
    }
  }

  Widget _buildDialog(BuildContext context) {
    final isLandscape = MediaQuery
        .of(context)
        .orientation == Orientation.landscape;
    final maxHeightPercentage = isLandscape ? 0.5 : 0.38;

    return Dialog (
      backgroundColor: context.containerColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * maxHeightPercentage,
            minWidth: 420,
            maxWidth: 420,
          ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(AppValues.height15),
              Row(
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
              ),
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
              _buildMainContent(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PrimaryButton(
                    buttonText: 'fund'.tr(),
                    onPressed: (){
                      if (!widget.showInput) {
                        setState(() {
                          widget.showInput = true;
                        });
                      } else {
                        context.pop();
                      }
                    },
                    isActive: true
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          ),
          verticalSpace(8),
          Text(
            _dialogText,
            textAlign: TextAlign.center,
            style: AppTheme.of(context)
                .bodyLarge16
                .copyWith(color: context.subTitleTextColor),
          ),
          _buildMainContent(context),
          PrimaryButton(
              buttonText: 'fund'.tr(),
              onPressed: () {
                if (!widget.showInput) {
                  setState(() {
                    widget.showInput = true;
                  });
                } else {
                  context.pop();
                }
              },
              isActive: true
          )
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    if (!widget.showInput) {
      return Column(
        children: [
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                child:
                SvgPicture.asset(AppIcons.fundWalletIcon, fit: BoxFit.contain),
              ),
            ],
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
              hintStyle: AppTheme.of(context).headingMobileH1.copyWith(
                color: context.textHintColor,
              ),
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
}