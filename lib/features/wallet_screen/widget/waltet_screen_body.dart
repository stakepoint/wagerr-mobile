part of '../../feature.dart';

class WalletScreenBody extends ConsumerWidget {
  const WalletScreenBody({
    super.key,
  });

 Widget _buildTransactionItem(
  BuildContext context, {
  required String description,
  required String date,
  required String amount,
  Color? iconBgColor,
  required bool isUpward,
  bool showGreenAmount = false,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Transform.rotate(
  angle: isUpward ? -math.pi / -4 : math.pi / 4,
  child: Icon(
    isUpward ? Icons.arrow_upward_sharp : Icons.arrow_downward,
    size: 20,
    color: isUpward ? Colors.black : Colors.green,
  ),
),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style: AppTheme.of(context).bodyLarge16,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                date,
                style: AppTheme.of(context).textSmallMedium.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
       Row(
  children: [
    Container(
      width: 16,
      height: 16,
      margin: const EdgeInsets.only(right: 4),
      child: Image.asset(AppIcons.starknetImage), 
    ),
    horizontalSpace(4), 
    Text(
      amount,
      style: AppTheme.of(context).bodyLarge16.copyWith(
        color: showGreenAmount ? Colors.green : null,
      ),
    ),
  ],
),

      ],
    ),
  );
}

  void _showFundWalletDialog(BuildContext context) {
    final isMobile = ScreenLayout.isMobile(context);

    if (isMobile) {
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
    final isMobile = ScreenLayout.isMobile(context);
    return Column(
      children: [
        isMobile
            ? _mobileContractAddress(context)
            : _tabletContractAddress(context),
        verticalSpace(8),
        isMobile ? _mobileStarkAmount(context) : _tabletStarkAmount(context),
        verticalSpace(16),
        isMobile ? HomeAddAndWithdraw() : SizedBox(),
        isMobile ? verticalSpace(48) : verticalSpace(40),
        isMobile ? _mobileRecentTransactions(context) : _tabletRecentTransactions(context),
      ],
    );
  }


//----------------------------------------------- MOBILE_RECENT_TRANSACTIONS ----------------------------------------------- //

  Widget _mobileRecentTransactions(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'recentTransactions'.tr(),
        style: AppTheme.of(context).bodyLarge16,
      ),
      verticalSpace(16),
      _buildTransactionItem(
        context,
        description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
        date: 'November 24, 2024',
        amount: '5 Strk',
        iconBgColor: const Color(0xFFEFF1F5),
        isUpward: true,
      ),
      verticalSpace(8),
      _buildTransactionItem(
        context,
        description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
        date: 'November 24, 2024',
        amount: '5 Strk',
        iconBgColor: const Color(0xFFEFF1F5),
        isUpward: true,
      ),
      verticalSpace(8),
      _buildTransactionItem(
        context,
        description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
        date: 'November 24, 2024',
        amount: '5 Strk',
        iconBgColor: const Color(0xFFEFF1F5),
        isUpward: false,
        showGreenAmount: true,
      ),
    ],
  );
}

  //----------------------------------------------- TABLET_RECENT_TRANSACTIONS ----------------------------------------------- //

Widget _tabletRecentTransactions(BuildContext context) {
  return Container(
    width: 696,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'recentTransactions'.tr(),
          style: AppTheme.of(context).bodyLarge16,
        ),
        verticalSpace(24),
        _buildTransactionItem(
          context,
          description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
          date: 'November 24, 2024',
          amount: '5 Strk',
          iconBgColor: const Color(0xFFEFF1F5),
          isUpward: true,
        ),
        verticalSpace(8),
        _buildTransactionItem(
          context,
          description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
          date: 'November 24, 2024',
          amount: '5 Strk',
          iconBgColor: const Color(0xFFEFF1F5),
          isUpward: true,
        ),
        verticalSpace(8),
        _buildTransactionItem(
          context,
          description: 'Created Wager: Will Bitcoin Hit \$100k Before January 31, 2025?',
          date: 'November 24, 2024',
          amount: '5 Strk',
          iconBgColor: const Color(0xFFEFF1F5),
          isUpward: false,
          showGreenAmount: true,
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
