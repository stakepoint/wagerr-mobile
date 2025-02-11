part of '../feature.dart';

class PendingScreen extends ConsumerWidget {
  const PendingScreen({
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
