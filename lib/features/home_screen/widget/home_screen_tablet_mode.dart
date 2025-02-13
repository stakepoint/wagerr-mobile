part of '../../feature.dart';

class HomeScreenTabletMode extends ConsumerWidget {
  const HomeScreenTabletMode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('home'.tr(), style: AppTheme.of(context).headLineLarge32),
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
            )
          ],
        ),
        verticalSpace(80),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.isLandscape ? 120 : 60),
          child: HomeScreenBody(),
        ),
      ],
    ));
  }
}
