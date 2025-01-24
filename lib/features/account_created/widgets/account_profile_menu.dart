import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class AccountProfileMenu extends ConsumerWidget {
  const AccountProfileMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        _accountProfileImage(context),
        horizontalSpace(12),
        _copyUsername(context),
      ],
    );
  }
}

// COPY USERNAME
Widget _copyUsername(BuildContext context) => Container(
      height: 29,
      width: 116,
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '@noyi24_7',
            style: AppTheme.textSmallMedium
                .copyWith(color: context.primaryTextColor),
          ),
          SvgPicture.asset(
            AppIcons.copyIcon,
            width: 15,
            height: 15,
          ),
        ],
      ),
    );

// USER PROFILE IMAGE

Widget _accountProfileImage(BuildContext context) => Container(
    height: 64,
    width: 64,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    child: Image.asset(AppIcons.userImage, fit: BoxFit.cover));
