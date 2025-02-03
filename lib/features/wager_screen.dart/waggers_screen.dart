import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/assets.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/wager_screen.dart/widget/mobile_body.dart';
import 'package:starkwager/routing/routes.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';

class WaggersScreen extends ConsumerWidget {
  const WaggersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      floatingActionButton: ScreenLayout.isTablet(context) ? isPortrait
          ? _floatingActionButton(context)
          : SizedBox() : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return isMobile
                ? _buildMobileLayout()
                : _buildTabletLayout(context);
          },
        ),
      ),
    );
  }

//----------------------------------------------- MOBILEVIEW ----------------------------------------------- //

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

//----------------------------------------------- TABLETVIEW ----------------------------------------------- //

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

//----------------------------------------------- FLOATINGACTIONBUTTON ----------------------------------------------- //

  Widget _floatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.create_wager);
      },
      child: Container(
        height: 56,
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.green100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
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
            Text(
              'newWager'.tr(),
              style: AppTheme.textMediumMedium.copyWith(
                color: AppColors.blue950,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
