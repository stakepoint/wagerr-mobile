part of '../feature.dart';

class WagersScreen extends ConsumerWidget {
  const WagersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      floatingActionButton: ScreenLayout.isTablet(context)
          ? isPortrait
              ? _floatingActionButton(context)
              : SizedBox()
          : _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return context.isMobile
                ? _buildMobileLayout()
                : _buildTabletLayout(context);
          },
        ),
      ),
    );
  }

//----------------------------------------------- MOBILE_VIEW ----------------------------------------------- //

  Widget _buildMobileLayout() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppValues.width600),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: MobileBody(),
            ),
          ],
        ),
      ),
    );
  }

//----------------------------------------------- TABLET_VIEW ----------------------------------------------- //

  Widget _buildTabletLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: AppValues.width1440),
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MobileBody(),
            ),
          ],
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
