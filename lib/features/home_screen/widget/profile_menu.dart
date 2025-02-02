import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class ProfileMenu extends ConsumerWidget {
  const ProfileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isMobile = ScreenLayout.isMobile(context);
    return Row(
      children: [
        _userProfileImage(_isMobile),
        horizontalSpace(12),
        _copyUserName(_isMobile, context)
      ],
    );
  }

//----------------------------------------------- COPYUSERNAME ----------------------------------------------- //

  Widget _copyUserName(bool _isMobile, BuildContext context) {
    return Container(
      height: _isMobile ? 26 : 29,
      width: _isMobile ? 104 : 117,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.baseWhite,
      ),
      child: _isMobile
          ? Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@noyi24_7',
                  style: AppTheme.of(context).textSmallMedium
                ),
                SvgPicture.asset(AppIcons.copyIcon)
              ],
            )
          : Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@noyi24_7',
                  style: AppTheme.of(context).textRegularMedium
                ),
                SvgPicture.asset(
                  AppIcons.copyIcon,
                  width: 15,
                  height: 15,
                ),
              ],
            ),
    );
  }

//----------------------------------------------- USERPROFILEIMAGE ----------------------------------------------- //

  Widget _userProfileImage(bool _isMobile) {
    return Container(
      height: _isMobile ? 48 : 64,
      width: _isMobile ? 48 : 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(AppIcons.userImage),
    );
  }
}
