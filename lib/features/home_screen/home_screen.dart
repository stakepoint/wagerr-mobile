part of '../feature.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: context.isMobile ? HomeScreenAppBar() : null,
      backgroundColor: context.primaryBackgroundColor,
      floatingActionButton: context.isMobile || context.isPortrait
          ? _floatingActionButton(context)
          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            final double maxWidthTablet = AppValues.width1440;
            return context.isMobile
                ? ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          verticalSpace(48),
                          HomeScreenBody(),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidthTablet),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: HomeScreenTabletMode(),
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
        height: context.isMobile ? 56 : 76,
        width: context.isMobile ? 160 : 200,
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
