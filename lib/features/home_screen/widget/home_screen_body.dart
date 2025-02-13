part of '../../feature.dart';

class HomeScreenBody extends ConsumerWidget {
  const HomeScreenBody({
    super.key,
  });

  void _showFundWalletDialog(BuildContext context) {
    if (context.isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => FundWalletDialog(),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => FundWalletDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _walletAddressWidget(context),
        verticalSpace(8),
        context.isMobile
            ? _mobileStarkAmount(context)
            : _tabletStarkAmount(context),
        verticalSpace(16),
        context.isMobile ? HomeAddAndWithdraw() : SizedBox(),
        verticalSpace(40),
        context.isMobile ? _mobileNoWager(context) : _tabletNoWager(context),
      ],
    );
  }

//----------------------------------------------- MOBILE_NO_WAGER ----------------------------------------------- //

  Widget _mobileNoWager(BuildContext context) {
    return Container(
      height: 81,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.containerColor,
      ),
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          horizontalSpace(16),
          SvgPicture.asset(AppIcons.noWagerIcon),
          Text(
            'noWagersCreatedYet'.tr(),
            style: AppTheme.of(context).bodyLarge16.copyWith(
                  color: context.textHintColor,
                ),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------- MOBILE_NO_WAGER ----------------------------------------------- //

  Widget _tabletNoWager(BuildContext context) {
    return Container(
      height: 175,
      width: 696,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.containerColor,
      ),
      child: Column(
        spacing: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.noWagerIcon, width: 88, height: 88),
          Text(
            'noWagersCreatedYet'.tr(),
            style: AppTheme.of(context).textMediumNormal.copyWith(
                  color: context.textHintColor,
                ),
          ),
        ],
      ),
    );
  }

//----------------------------------------------- MOBILE_STARK_AMOUNT ----------------------------------------------- //

  Widget _mobileStarkAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$0.00', style: AppTheme.of(context).headingMobileH1),
        Row(
          children: [
            Image.asset(AppIcons.starknetImage),
            horizontalSpace(4),
            Text('${'0'} Strk', style: AppTheme.of(context).textSmallMedium),
          ],
        ),
      ],
    );
  }

//----------------------------------------------- TABLET_STARK_AMOUNT ----------------------------------------------- //

  Widget _tabletStarkAmount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Text('\$0.00', style: AppTheme.of(context).headingMobileH1),
            Row(
              children: [
                Image.asset(AppIcons.starknetImage),
                horizontalSpace(4),
                Text('${'0'} Strk',
                    style: AppTheme.of(context).textSmallMedium),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            spacing: 16,
            children: [
              HomeActionButton(
                text: 'addMoney'.tr(),
                iconPath: AppIcons.addIcon,
                onTap: () => _showFundWalletDialog(context),
              ),
              HomeActionButton(
                text: 'withdraw'.tr(),
                iconPath: AppIcons.withdrawIcon,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }

//----------------------------------------------- WALLET_ADDRESS ----------------------------------------------- //

  Widget _walletAddressWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: context.isMobile
              ? AppTheme.of(context).bodyMedium14.copyWith(
                    color: context.textHintColor,
                  )
              : AppTheme.of(context).bodyLarge16.copyWith(
                    color: context.textHintColor,
                  ),
        ),
        CopyItemContainer(value: '0x234233424322'),
      ],
    );
  }
}
