part of '../../feature.dart';

class WagerCreatedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WagerCreatedAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Padding(
        padding: EdgeInsets.only(right: AppValues.padding24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WagerProfileMenu(),
            horizontalSpace(AppValues.padding16),
            SvgPicture.asset(width: 25, height: 25, AppIcons.notificationIcon),
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: context.primaryBackgroundColor,
      foregroundColor: context.primaryBackgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
