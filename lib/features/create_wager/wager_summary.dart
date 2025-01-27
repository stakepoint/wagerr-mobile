import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_theme.dart';
import 'package:starkwager/utils/ui_widgets.dart';

class WagerSummary extends ConsumerWidget {
  const WagerSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.secondaryBackgroundColor,
        actions: [],
      ),
      backgroundColor: context.secondaryBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WAGER SUMMARY'.tr(),
                      style: AppTheme.headLineLarge32
                          .copyWith(color: context.primaryTextColor),
                    ),
                    verticalSpace(AppValues.height8),
                    verticalDivider(color: context.dividerColor),
                    verticalSpace(AppValues.height8),
                    Container(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
