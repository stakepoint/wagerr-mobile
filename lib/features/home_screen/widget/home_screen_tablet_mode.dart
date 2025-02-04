part of '../../feature.dart';

class HomeScreenTabletMode extends ConsumerWidget {
  const HomeScreenTabletMode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home', style: AppTheme.of(context).headLineLarge32),
            Row(
              children: [
                GestureDetector(
                  onTap: () => GoRouter.of(context).go(Routes.profileSetup),
                  child: ProfileMenu(),
                ),
                horizontalSpace(24),
                SvgPicture.asset(
                  AppIcons.notificationIcon,
                  width: 20,
                  height: 20,
                ),
              ],
            )
          ],
        ),
        verticalSpace(120),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isLandscape ? 120 : 60),
          child: HomeScreenBody(),
        ),
      ],
    ));
  }
}
