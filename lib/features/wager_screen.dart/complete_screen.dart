part of '../feature.dart';

class CompleteScreen extends ConsumerWidget {
  const CompleteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'noWagersCreatedYet'.tr(),
          style: AppTheme.of(context).bodyLarge16.copyWith(
                color: context.textHintColor,
              ),
        ),
      ],
    );
  }
}
