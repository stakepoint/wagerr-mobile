import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:starkwager/features/connect_wallet/provider/wallet_connection_state.dart';

final argentCheckProvider = FutureProvider<bool>((ref) async {
  final appCheck = AppCheck();
  late bool isArgentInstalled;
  if (Platform.isAndroid) {
    const package = "im.argent.contractwalletclient";
    await appCheck.checkAvailability(package).then(
      (app) {
        if (app?.appName.toString() != null) {
          isArgentInstalled = true;
        }
      },
    );
    return isArgentInstalled;
  } else if (Platform.isIOS) {
    await appCheck.checkAvailability("argent://").then(
      (app) {
        if (app?.appName.toString() != null) {
          isArgentInstalled = true;
        }
      },
    );
    return isArgentInstalled;
  }
  return false;
});

final braavosCheckProvider = FutureProvider<bool>((ref) async {
  final appCheck = AppCheck();
  late bool isBraavosInstalled;
  if (Platform.isAndroid) {
    const package = "app.braavos.wallet";
    await appCheck.checkAvailability(package).then(
      (app) {
        if (app?.appName.toString() != null) {
          isBraavosInstalled = true;
        }
      },
    );
    return isBraavosInstalled;
  } else if (Platform.isIOS) {
    await appCheck.checkAvailability("braavos://").then(
      (app) {
        if (app?.appName.toString() != null) {
          isBraavosInstalled = true;
        }
      },
    );
    return isBraavosInstalled;
  }
  return false;
});

final metamaskCheckProvider = FutureProvider<bool>((ref) async {
  final appCheck = AppCheck();
  late bool isMetaMaskInstalled;
  if (Platform.isAndroid) {
    const package = "app.metamask.wallet";
    await appCheck.checkAvailability(package).then(
      (app) {
        if (app?.appName.toString() != null) {
          isMetaMaskInstalled = true;
        }
      },
    );
    return isMetaMaskInstalled;
  } else if (Platform.isIOS) {
    await appCheck.checkAvailability("metamask://").then(
      (app) {
        if (app?.appName.toString() != null) {
          isMetaMaskInstalled = true;
        }
      },
    );
    return isMetaMaskInstalled;
  }
  return false;
});

final walletConnectionProvider =
    StateNotifierProvider<WalletConnectionNotifier, WalletConnectionState>(
  (ref) => WalletConnectionNotifier(),
);

class WalletConnectionNotifier extends StateNotifier<WalletConnectionState> {
  WalletConnectionNotifier() : super(const WalletConnectionState.initial());

  late ReownAppKitModal w3mService;

  Future<void> initialize(BuildContext context) async {
    state = const WalletConnectionState.initializing();

    final Set<String> includedWalletIds = {
      'bc949c5d968ae81310268bf9193f9c9fb7bb4e1283e1284af8f2bd4992535fd6', // Argent
      'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96', // MetaMask
      '4622a2b2d6af1c9844944291e5e7351a6aa24cd7b23099efac1b2fd875da31a0', // Trust
    };

    try {
      const String url = 'https://github.com/stakepoint/starkwager-mobile';
      w3mService = ReownAppKitModal(
        context: context,
        projectId: 'ca39991258c8cb8f99a5ff8eae88b6c5',
        metadata: const PairingMetadata(
          name: 'Starkwager',
          description: 'A decentralized wagering platform',
          url: url,
          icons: <String>[],
          redirect: Redirect(universal: url, native: url),
        ),
        includedWalletIds: includedWalletIds,
      );
      debugPrint("🔄 Initializing AppKitModal...");
      await w3mService.init();
      debugPrint("✅ AppKitModal Initialized Successfully!");
      await w3mService.selectChain(
        ReownAppKitModalNetworkInfo(
          chainId: '11155111',
          name: 'Sepolia',
          currency: 'ETH',
          rpcUrl: 'https://1rpc.io/sepolia',
          explorerUrl: 'https://sepolia.etherscan.io/',
        ),
      );

      if (!w3mService.isConnected) {
        listenToWalletConnection();
      }
      state = WalletConnectionState.connected(service: w3mService);
    } catch (e) {
      state = WalletConnectionState.failed(
        errorCode: 'CONNECTION_ERROR',
        message: e.toString(),
      );
    }
  }

  Future<void> listenToWalletConnection() async {
    try {
      w3mService.onModalConnect.subscribe(
          (_) => WalletConnectionState.connected(service: w3mService));
    } catch (e) {
      state = const WalletConnectionFailed(
        errorCode: '',
        message: 'Wallet Connection Failed',
      );
    }
  }

  Future<void> disconnectWallet() async {
    await w3mService.disconnect();
    state = const WalletConnectionState.disconnected();
  }
}
