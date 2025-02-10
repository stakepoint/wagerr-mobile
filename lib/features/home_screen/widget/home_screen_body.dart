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
        builder: (BuildContext context) => FundWalletDialog(
          onClose: () => Navigator.of(context).pop(),
          onFund: () {
            // Add your funding logic here
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => FundWalletDialog(
          onClose: () => Navigator.of(context).pop(),
          onFund: () {
            // Add your funding logic here
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        context.isMobile
            ? _mobileContractAddress(context)
            : _tabletContractAddress(context),
        verticalSpace(8),
        context.isMobile
            ? _mobileStarkAmount(context)
            : _tabletStarkAmount(context),
        verticalSpace(16),
        context.isMobile ? HomeAddAndWithdraw() : SizedBox(),
        context.isMobile ? verticalSpace(48) : verticalSpace(40),
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
          SvgPicture.asset(AppIcons.noWaggerIcon),
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
          SvgPicture.asset(AppIcons.noWaggerIcon, width: 88, height: 88),
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

//----------------------------------------------- MOBILE_CONTRACT_ADDRESS ----------------------------------------------- //

  Widget _mobileContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.of(context).bodyMedium14.copyWith(
                color: context.textHintColor,
              ),
        ),
        Container(
          height: 29,
          width: 151,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.containerColor,
          ),
          child: Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0x400e44000...',
                  style: AppTheme.of(context).textSmallMedium),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }

//----------------------------------------------- TABLET_CONTRACT_ADDRESS ----------------------------------------------- //

  Widget _tabletContractAddress(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'walletBalance'.tr(),
          style: AppTheme.of(context).bodyLarge16.copyWith(
                color: context.textHintColor,
              ),
        ),
        Container(
          height: 29,
          width: 151,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.containerColor,
          ),
          child: Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0x400e44000...',
                  style: AppTheme.of(context).textRegularMedium),
              SvgPicture.asset(AppIcons.copyIcon)
            ],
          ),
        ),
      ],
    );
  }
}
