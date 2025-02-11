part of '../../feature.dart';

class MobileBody extends ConsumerStatefulWidget {
  const MobileBody({super.key});

  @override
  ConsumerState<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends ConsumerState<MobileBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
//----------------------------------------------- TOPBAR ----------------------------------------------- //

        verticalSpace(25),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('WAGERS'.tr(),
                            style: AppTheme.of(context).headLineLarge32),
                        Row(
                          children: [
                            ProfileMenu(),
                            horizontalSpace(24),
                            SvgPicture.asset(
                              AppIcons.notificationIcon,
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Text('WAGERS'.tr(),
                    style: AppTheme.of(context).headLineLarge32)
            : Text('WAGERS'.tr(), style: AppTheme.of(context).headLineLarge32),

//----------------------------------------------- TAB BAR ----------------------------------------------- //

        ScreenLayout.isTablet(context)
            ? isLandscape
                ? verticalSpace(100)
                : verticalSpace(44)
            : verticalSpace(24),
        ScreenLayout.isTablet(context)
            ? isLandscape
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 270),
                    child: TabWidget(
                      controller: _tabController,
                      tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
                    ),
                  )
                : isPortrait
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: TabWidget(
                          controller: _tabController,
                          tabs: [
                            'active'.tr(),
                            'pending'.tr(),
                            'complete'.tr()
                          ],
                        ),
                      )
                    : TabWidget(
                        controller: _tabController,
                        tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
                      )
            : TabWidget(
                controller: _tabController,
                tabs: ['active'.tr(), 'pending'.tr(), 'complete'.tr()],
              ),
        verticalSpace(24),

//----------------------------------------------- CONTENT ----------------------------------------------- //

        Expanded(
          child: Padding(
            padding: ScreenLayout.isTablet(context)
                ? isPortrait
                    ? const EdgeInsets.symmetric(horizontal: 90)
                    : EdgeInsets.zero
                : EdgeInsets.zero,
            child: TabBarView(
              controller: _tabController,
              children: const [
                ActiveScreen(),
                PendingScreen(),
                CompleteScreen(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
