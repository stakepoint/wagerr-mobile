import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/theme/app_theme.dart';

class CompleteScreen extends ConsumerWidget {
  const CompleteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'nowagerscreatedyet'.tr(),
          style: AppTheme.of(context).bodyLarge16.copyWith(
            color: context.textHintColor,
          ),
        ),
      ],
    );
  }
}
