part of '../feature.dart';

class ConnectWalletScreen extends ConsumerWidget {
  ConnectWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final argent = ref.watch(argentCheckProvider);
    final braavos = ref.watch(braavosCheckProvider);
    final metamask = ref.watch(metamaskCheckProvider);
    final _isMobile = ScreenLayout.isMobile(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppValues.padding16),
            child: GestureDetector(
                onTap: () {
                  _isMobile
                      ? GoRouter.of(context).go(Routes.profileSetup)
                      : GoRouter.of(context).go(Routes.profileSetup);
                },
                child: SvgPicture.asset(AppIcons.hamburgerIcon)),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: context.primaryBackgroundColor,
        foregroundColor: context.primaryTextColor,
      ),
      backgroundColor: context.primaryBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = AppValues.width600;
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.padding16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(AppValues.height60),
                      Text(
                        'welcomeToStarkWager'.tr(),
                        style: AppTheme.of(context).headLineLarge32
                      ),
                      verticalSpace(AppValues.height8),
                      Row(
                        children: [
                          Text(
                            'connectYourWalletToUse'.tr(),
                            style: AppTheme.of(context).bodyExtraLarge18
                          ),
                          horizontalSpace(AppValues.padding3),
                          Text(
                            'starkWager'.tr(),
                            style: AppTheme.of(context).bodyExtraLarge18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      verticalSpace(AppValues.height30),
                      verticalDivider(color: context.dividerColor),
                      verticalSpace(AppValues.height30),
                      argent.when(
                          data: (isInstalled) => InstalledWalletWidget(
                                title: 'Argent X',
                                icon: Image.asset(AppIcons.argentIcon),
                                isInstalled: isInstalled,
                                onTap: () {},
                              ),
                          error: (error, stack) => InstalledWalletWidget(
                                title: 'Argent X',
                                icon: Image.asset(AppIcons.argentIcon),
                                isInstalled: false,
                                onTap: () {},
                              ),
                          loading: () => const CircularProgressIndicator()),
                      verticalSpace(AppValues.height15),
                      braavos.when(
                          data: (isInstalled) => InstalledWalletWidget(
                                title: 'Braavos',
                                icon: Image.asset(AppIcons.braavosIcon),
                                isInstalled: isInstalled,
                                onTap: () {},
                              ),
                          error: (error, stack) => InstalledWalletWidget(
                                title: 'Braavos',
                                icon: Image.asset(AppIcons.braavosIcon),
                                isInstalled: false,
                                onTap: () {},
                              ),
                          loading: () => const CircularProgressIndicator()),
                      verticalSpace(AppValues.height15),
                      metamask.when(
                          data: (isInstalled) => InstalledWalletWidget(
                                title: 'Metamask',
                                icon: SvgPicture.asset(AppIcons.metaMaskIcon,
                                    width: AppValues.width24,
                                    height: AppValues.height24),
                                isInstalled: isInstalled,
                                onTap: () {},
                              ),
                          error: (error, stack) => InstalledWalletWidget(
                                title: 'Metamask',
                                icon: SvgPicture.asset(AppIcons.metaMaskIcon,
                                    width: AppValues.width24,
                                    height: AppValues.height24),
                                isInstalled: false,
                                onTap: () {},
                              ),
                          loading: () => const CircularProgressIndicator()),
                      verticalSpace(AppValues.height15),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
