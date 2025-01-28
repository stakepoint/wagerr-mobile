import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/core/constants/screen_layout.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/wager_created/widgets/wager_created_app_bar.dart';
import 'package:starkwager/features/wager_created/widgets/wager_created_body.dart';

class WagerCreatedScreen extends ConsumerWidget {
  WagerCreatedScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ScreenLayout.isMobile(context);
    return Scaffold(
      appBar: !isMobile ? WargerCreatedAppBar() : null,
      backgroundColor: context.primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = AppValues.width500;
              final double maxWidthTablet = AppValues.width1440;
              return isMobile
                  ? ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidth),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: maxWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100, left: 24, right: 24, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WargerCreatedBody(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxWidthTablet),
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: AppValues.width500,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 120),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                WargerCreatedBody(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
