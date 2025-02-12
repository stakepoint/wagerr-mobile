part of '../../feature.dart';

class InstalledWalletWidget extends ConsumerWidget {
  final String title;
  final Widget icon;
  final bool isInstalled;
  final Function() onTap;

  const InstalledWalletWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.isInstalled,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: AppValues.height56,
        decoration: BoxDecoration(
          color: context.containerColor,
          borderRadius: BorderRadius.circular(AppValues.radius16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppValues.padding24, vertical: AppValues.padding12),
          child: Row(
            children: [
              icon,
              horizontalSpace(AppValues.padding10),
              Text(
                isInstalled ? title : '${'install'.tr()} $title',
                style: AppTheme.of(context)
                    .bodyExtraLarge18
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Visibility(
                visible: isInstalled,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.containerColor,
                    border: Border.all(
                        width: AppValues.width1,
                        color: context.secondaryBackgroundColor),
                    borderRadius: BorderRadius.circular(AppValues.radius4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppValues.padding8),
                    child: Text(
                      'installed'.tr(),
                      style: AppTheme.of(context)
                          .bodySmall12
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
