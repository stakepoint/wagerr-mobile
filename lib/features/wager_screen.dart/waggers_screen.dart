import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/features/wager_screen.dart/widget/mobile_body.dart';
import 'package:starkwager/theme/app_colors.dart';
import 'package:starkwager/theme/app_theme.dart';

class WaggersScreen extends ConsumerWidget {
  const WaggersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);

    return Scaffold(
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
        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding16),
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
}
