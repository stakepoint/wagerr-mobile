import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/extensions/build_context_extension.dart';

import '../../core/constants/app_values.dart';
import '../../core/constants/screen_layout.dart';
import '../../theme/app_theme.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            final double maxWidthTablet = AppValues.width1440;
            return context.isMobile
                ? ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppValues.padding16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Wallet Screen",
                              style: AppTheme.of(context).bodyLarge16),
                        ],
                      ),
                    ),
                  )
                : ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidthTablet),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Wallet Screen",
                            style: AppTheme.of(context).bodyLarge16),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
