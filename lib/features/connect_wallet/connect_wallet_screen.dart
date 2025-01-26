import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:starkwager/core/constants/app_values.dart';
import 'package:starkwager/extensions/build_context_extension.dart';
import 'package:starkwager/features/connect_wallet/provider/connect_wallet_provider.dart';
import 'package:starkwager/features/connect_wallet/widgets/installed_wallet_widget.dart';
import 'package:starkwager/utils/ui_widgets.dart';

import '../../core/constants/assets.dart';
import '../../theme/app_theme.dart';

class ConnectWalletScreen extends ConsumerWidget {
  ConnectWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize ReownAppKitModal instance
    final _appKitModal = ReownAppKitModal(
      context: context,
      // Your Project ID
      projectId: 'PROJECT', // Ensure this is correct
      metadata: const PairingMetadata(
        name: 'MyApp',
        description: 'A decentralized app',
        url: 'https://myapp.com/',
        icons: ['https://myapp.com/icon.png'],
        redirect: Redirect(
          native: 'myapp://',
          universal: 'https://myapp.com',
          linkMode: true,
        ),
      ),
    );

    // Watch providers for installed wallets
    final argent = ref.watch(argentCheckProvider);
    final braavos = ref.watch(braavosCheckProvider);
    final metamask = ref.watch(metamaskCheckProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppValues.padding16),
            child: SvgPicture.asset(AppIcons.hamburgerIcon),
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
                        style: AppTheme.headLineLarge32
                            .copyWith(color: context.primaryTextColor),
                      ),
                      verticalSpace(AppValues.height8),
                      Row(
                        children: [
                          Text(
                            'connectYourWalletToUse'.tr(),
                            style: AppTheme.titleMedium18
                                .copyWith(color: context.primaryTextColor),
                          ),
                          horizontalSpace(AppValues.padding3),
                          Text(
                            'starkWager'.tr(),
                            style: AppTheme.titleMedium18.copyWith(
                              color: context.primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(AppValues.height30),
                      verticalDivider(color: context.dividerColor),
                      verticalSpace(AppValues.height30),

                      // AppKit Modal Balance Button
                      AppKitModalBalanceButton(
                        appKitModal: _appKitModal,
                        onTap: () async {
                          await _initializeAndOpenModal(_appKitModal);
                        },
                      ),

                      // Argent X Wallet
                      argent.when(
                        data: (isInstalled) => InstalledWalletWidget(
                          title: 'Argent X',
                          icon: Image.asset(AppIcons.argentIcon),
                          isInstalled: isInstalled,
                          onTap: () async {
                            await _initializeAndOpenModal(_appKitModal);
                          },
                        ),
                        error: (_, __) => InstalledWalletWidget(
                          title: 'Argent X',
                          icon: Image.asset(AppIcons.argentIcon),
                          isInstalled: false,
                          onTap: () {},
                        ),
                        loading: () => const CircularProgressIndicator(),
                      ),
                      verticalSpace(AppValues.height15),

                      // Braavos Wallet
                      braavos.when(
                        data: (isInstalled) => InstalledWalletWidget(
                          title: 'Braavos',
                          icon: Image.asset(AppIcons.braavosIcon),
                          isInstalled: isInstalled,
                          onTap: () async {
                            await _initializeAndOpenModal(_appKitModal);
                          },
                        ),
                        error: (_, __) => InstalledWalletWidget(
                          title: 'Braavos',
                          icon: Image.asset(AppIcons.braavosIcon),
                          isInstalled: false,
                          onTap: () {},
                        ),
                        loading: () => const CircularProgressIndicator(),
                      ),
                      verticalSpace(AppValues.height15),

                      // Metamask Wallet
                      metamask.when(
                        data: (isInstalled) => InstalledWalletWidget(
                          title: 'Metamask',
                          icon: SvgPicture.asset(
                            AppIcons.metaMaskIcon,
                            width: AppValues.width24,
                            height: AppValues.height24,
                          ),
                          isInstalled: isInstalled,
                          onTap: () async {
                            await _initializeAndOpenModal(_appKitModal);
                          },
                        ),
                        error: (_, __) => InstalledWalletWidget(
                          title: 'Metamask',
                          icon: SvgPicture.asset(
                            AppIcons.metaMaskIcon,
                            width: AppValues.width24,
                            height: AppValues.height24,
                          ),
                          isInstalled: false,
                          onTap: () {},
                        ),
                        loading: () => const CircularProgressIndicator(),
                      ),
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

  // Function to initialize and open the modal
  Future<void> _initializeAndOpenModal(ReownAppKitModal appKitModal) async {
    try {
      print("🔄 Initializing AppKitModal...");
      await appKitModal.init();
      print("✅ AppKitModal Initialized Successfully!");
      appKitModal.openModalView(ReownAppKitModalAllWalletsPage());
    } catch (e) {
      print("❌ Error initializing AppKitModal: $e");
    }
  }
}
