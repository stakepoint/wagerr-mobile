part of '../feature.dart';

class WagerSummaryScreen extends ConsumerWidget {
  const WagerSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BaseAppbar(
          context: context, title: 'wagerSummary'.tr(), userName: '@noyi24_7'),
      backgroundColor: context.primaryBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.isMobile ? AppValues.padding20 : 120,
                  ),
                  child: Column(
                    crossAxisAlignment: context.isMobile
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    children: [
                      if (context.isMobile)
                        Text(
                          'wagerSummary'.tr(),
                          style: AppTheme.of(context).headLineLarge32,
                        ),
                      verticalSpace(AppValues.height20),
                      if (context.isMobile)
                        verticalDivider(color: context.dividerColor),
                      verticalSpace(AppValues.height20),
                      buildStrkVSContainer(
                        context,
                        '5',
                        '@noyi24_7',
                        'Awaiting Opponent'.tr(),
                      ),
                      verticalSpace(AppValues.height20),
                      buildSummarySections(context, 'Title of your Wager',
                          'Will Bitcoin Hit 100k Before January 31, 2025?'),
                      verticalSpace(AppValues.height20),
                      buildSummarySections(
                        context,
                        'Potential Winnings',
                        '10 Strk',
                        isPotentialWinning: true,
                      ),
                      verticalSpace(AppValues.height20),
                      buildSummarySections(
                        context,
                        'Platform Fee',
                        '5.0%',
                        hasInfo: true,
                        infoOnTap: () {},
                      ),
                      verticalSpace(AppValues.height20),
                      buildSummarySections(
                        context,
                        'Terms or Wager Description',
                        '''Think Bitcoin is on track to skyrocket past \$100k? Here's your chance to put your prediction to the test! This wager challenges participants to predict whether Bitcoin will reach or exceed the \$100,000 mark by January 31, 2025. The official price will be determined using CoinMarketCap's data at 11:59 PM UTC on the deadline date.
                        
                Participants must stake an equal amount of STRK tokens to join this head-to-head challenge. If Bitcoin hits or surpasses \$100k by the specified date and time, those who wager 'Yes' win the wager. If it falls short, those who wager 'No' take the prize.
                        
                No extensions, no exceptions—this is your chance to back your crypto knowledge with real stakes! Join now and see if your prediction skills can earn you the ultimate reward in STRK tokens. Let's see who's got what it takes to call the next big crypto move!''',
                      ),
                      verticalSpace(AppValues.height20),
                      buildCategoryHashtagSection(
                        context,
                        'Category',
                        wagerItems: [
                          'Crypto',
                        ],
                      ),
                      verticalSpace(AppValues.height20),
                      buildCategoryHashtagSection(
                        context,
                        'Hashtags',
                        hasHashtag: true,
                        wagerItems: [
                          'Bitcoin',
                          'Blockchain',
                        ],
                      ),
                      verticalSpace(AppValues.height20),
                      verticalDivider(color: context.dividerColor),
                      verticalSpace(AppValues.height20),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(AppValues.padding10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: context.secondaryBackgroundColor),
                          borderRadius:
                              BorderRadius.circular(AppValues.radius16),
                          color: context.primaryBackgroundColor,
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SvgPicture.asset(
                                AppIcons.infoIcon,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Always keep verifiable evidence of your wagers for dispute resolution purposes.'
                                    .tr(),
                                style: AppTheme.of(context).textSmallMedium,
                                softWrap: true,
                                maxLines: null,
                                overflow: TextOverflow.visible,
                              ),
                            )
                          ],
                        ),
                      ),
                      verticalSpace(AppValues.height50),
                      PrimaryButton(
                        buttonText: 'Create Wager'.tr(),
                        isActive: true,
                        onPressed: () {
                          GoRouter.of(context).push(Routes.wagerCreated);
                        },
                      ),
                      verticalSpace(AppValues.height20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildCategoryHashtagSection(
    BuildContext context,
    String title, {
    bool hasHashtag = false,
    required List<String> wagerItems,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title.tr(),
              style: AppTheme.of(context).textSmallMedium.copyWith(
                    color: context.textHintColor,
                  ),
            ),
            SizedBox(
              height: 5,
            ),
            Wrap(
              spacing: 5,
              children: wagerItems
                  .map((item) => Container(
                        padding: EdgeInsets.all(AppValues.padding10),
                        decoration: BoxDecoration(
                          color: context.primaryBackgroundColor,
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (hasHashtag)
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(AppIcons.hashTagIcon),
                              ),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Text(
                                  item.tr(),
                                  style: AppTheme.of(context).textSmallMedium,
                                  softWrap: true,
                                  maxLines: null,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSummarySections(
    BuildContext context,
    String title,
    String wagerDescription, {
    bool hasInfo = false,
    bool isPotentialWinning = false,
    void Function()? infoOnTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr(),
          style: AppTheme.of(context).textSmallMedium.copyWith(
                color: context.textHintColor,
              ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: isPotentialWinning
              ? [
                  Container(
                    padding: EdgeInsets.all(AppValues.padding10),
                    decoration: BoxDecoration(
                      color: context.primaryBackgroundColor,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.snSymbol),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Text(
                              wagerDescription.tr(),
                              style: AppTheme.of(context).textSmallMedium,
                              softWrap: true,
                              maxLines: null,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              : [
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        wagerDescription.tr(),
                        style: AppTheme.of(context).textSmallMedium,
                        softWrap: true,
                        maxLines: null,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                  if (hasInfo)
                    GestureDetector(
                      onTap: infoOnTap,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset(
                          AppIcons.infoIcon,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                ],
        ),
      ],
    );
  }

  Widget buildStrkVSContainer(
      BuildContext context, String strkNumber, String user, String opponent) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppValues.padding10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.radius16),
        color: context.primaryBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(AppValues.height10),
          Container(
            padding: EdgeInsets.all(AppValues.padding10),
            decoration: BoxDecoration(
              color: context.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppIcons.snSymbol),
                SizedBox(
                  width: 5,
                ),
                Text('$strkNumber Strk each'.tr(),
                    style: AppTheme.of(context).textSmallMedium),
              ],
            ),
          ),
          verticalSpace(AppValues.height15),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(AppIcons.userPath),
                  verticalSpace(8),
                  Text(
                    user,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.of(context).bodySmall12,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('one-on-one'.tr(),
                        style: AppTheme.of(context).bodySmall12),
                    Text(
                      'VS',
                      style: AppTheme.of(context).headLineLarge32.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(AppIcons.awaitingUserPath),
                  verticalSpace(8),
                  Text(opponent,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.of(context).bodySmall12),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
