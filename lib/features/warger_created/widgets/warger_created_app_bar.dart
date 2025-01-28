import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/warger_created/widgets/warger_profile_menu.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class WargerCreatedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WargerCreatedAppBar({super.key});
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
            WargerProfileMenu(),
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
