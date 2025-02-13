part of '../../feature.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppbar(
      {super.key,
      required this.context,
      required this.title,
      required this.userName,
      this.showBackButton});

  final BuildContext context;
  final String title, userName;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      backgroundColor: context.primaryBackgroundColor,
      toolbarHeight: context.isMobile ? null : AppValues.height100,
      elevation: 0,
      title: context.isMobile
          ? IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: SvgPicture.asset(AppIcons.arrowBack),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: showBackButton == null ? true : false,
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AppIcons.arrowBack,
                      ),
                      onPressed: () => GoRouter.of(context).pop(),
                    ),
                  ),
                  horizontalSpace(AppValues.padding8),
                  Text(
                    !context.isMobile ? title : '',
                    style: AppTheme.of(context).headLineLarge32,
                  ),
                ],
              ),
            ),
      actions: [
        if (!context.isMobile)
          Container(
            padding: EdgeInsets.only(right: 80),
            child: Row(
              children: [
                Image.asset(AppIcons.userPath),
                horizontalSpace(8),
                CopyItemContainer(value: userName),
                horizontalSpace(AppValues.padding20),
                SvgPicture.asset(AppIcons.notificationPath),
              ],
            ),
          )
      ],
      centerTitle: context.isMobile ? false : true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(context.isMobile ? 50 : 100);
}
