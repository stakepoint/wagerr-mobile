import 'dart:io';
import 'package:appcheck/appcheck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
