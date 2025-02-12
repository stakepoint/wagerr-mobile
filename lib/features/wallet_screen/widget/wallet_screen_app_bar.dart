part of '../../feature.dart';

class WalletScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WalletScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.only(top: 33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileMenu(),
            const SizedBox(width: AppValues.padding16),
            SvgPicture.asset(AppIcons.notificationIcon),
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
