import 'dart:io';
import 'package:flutter/material.dart';
import 'package:appcheck/appcheck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reown_appkit/modal/appkit_modal_impl.dart';
import 'package:reown_appkit/reown_appkit.dart';

final argentCheckProvider = FutureProvider<bool>((ref) async {
  final appCheck = AppCheck();
  late bool isArgentInstalled;
  if (Platform.isAndroid){
    const package = "im.argent.contractwalletclient";
    await appCheck.checkAvailability(package).then((app) {
            if(app?.appName.toString() != null ){
              isArgentInstalled = true;
            }
      },
    );
    return isArgentInstalled;
  } else if (Platform.isIOS){
    await appCheck.checkAvailability("argent://").then((app){
      if(app?.appName.toString() != null ){
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
  if (Platform.isAndroid){
    const package = "app.braavos.wallet";
    await appCheck.checkAvailability(package).then((app) {
      if(app?.appName.toString() != null ){
        isBraavosInstalled = true;
      }
    },
    );
    return isBraavosInstalled;
  } else if (Platform.isIOS){
    await appCheck.checkAvailability("braavos://").then((app){
      if(app?.appName.toString() != null ){
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
  if (Platform.isAndroid){
    const package = "app.metamask.wallet";
    await appCheck.checkAvailability(package).then((app) {
      if(app?.appName.toString() != null ){
        isMetaMaskInstalled = true;
      }
    },
    );
    return isMetaMaskInstalled;
  } else if (Platform.isIOS){
    await appCheck.checkAvailability("metamask://").then((app){
      if(app?.appName.toString() != null ){
        isMetaMaskInstalled = true;
      }
    },
    );
    return isMetaMaskInstalled;
  }
  return false;
});

final appKitModalProvider = FutureProvider.family<ReownAppKitModal, BuildContext>((ref, context) async {

  final Set<String> includedWalletIds = {
    'bc949c5d968ae81310268bf9193f9c9fb7bb4e1283e1284af8f2bd4992535fd6', // Argent
    'c57ca95b47569778a828d19178114f4db188b89b763c899ba0be274e97267d96', // MetaMask
    '4622a2b2d6af1c9844944291e5e7351a6aa24cd7b23099efac1b2fd875da31a0', // Trust
  };

  final _appKitModal = ReownAppKitModal(
    context: context,
    projectId: 'c433d4e5293ae4e856d65a3d141f506a',
    metadata: const PairingMetadata(
      name: 'StarkWager',
      description: 'Decentralized wagering App',
      url: 'https://starkwager.xyz/',
      icons: ['https://example.com/logo.png'],
      redirect: Redirect(  // OPTIONAL
        native: 'starkwagerapp://',
        universal: 'https://starkwager.xyz/mobile',
        linkMode: false,
      ),
    ),
    includedWalletIds: includedWalletIds
  );
  print("🔄 Initializing AppKitModal...");
  await _appKitModal.init();
  print("✅ AppKitModal Initialized Successfully!");
  return _appKitModal;
});