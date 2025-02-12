import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reown_appkit/reown_appkit.dart';

part 'wallet_connection_state.freezed.dart';

@freezed
class WalletConnectionState with _$WalletConnectionState {
  const factory WalletConnectionState.initial() = InitialWalletConnectionState;
  const factory WalletConnectionState.initializing() =
      InitializingWalletConnectionState;
  const factory WalletConnectionState.connected({
    required ReownAppKitModal service,
  }) = WalletConnected;
  const factory WalletConnectionState.disconnected() = WalletDisconnected;
  const factory WalletConnectionState.failed({
    required String errorCode,
    required String message,
  }) = WalletConnectionFailed;
}
