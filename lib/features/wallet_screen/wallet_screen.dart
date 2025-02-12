part of '../feature.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      appBar: isMobile ? WalletScreenAppBar() : null,
      backgroundColor: context.primaryBackgroundColor,
      floatingActionButton:
          isMobile || isPortrait ? _floatingActionButton(context) : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            final double maxWidthTablet = AppValues.width1440;
            return isMobile
                ? ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(48),
                          WalletScreenBody(),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidthTablet),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, right: 80),
                      child: WalletScreenTabletMode(),
                    ),
                  );
          },
        ),
      ),
    );
  }

//----------------------------------------------- FLOATING_ACTION_BUTTON ----------------------------------------------- //

  Widget _floatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.createWager);
      },
      child: Container(
        height: 56,
        width: 160,
        decoration: BoxDecoration(
          color: context.primaryButtonColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcons.handshakeIcon),
            Text('newWager'.tr(), style: AppTheme.of(context).textMediumMedium),
          ],
        ),
      ),
    );
  }
}
