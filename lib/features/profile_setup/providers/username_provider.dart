import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'username_provider.g.dart';

@riverpod
class UsernameAvailability extends _$UsernameAvailability {
  @override
  Future<bool> build(String username) async {
    if (username.isEmpty) return false;

    // TODO: Implement actual API call to check username availability
    // Simulating API call
    await Future.delayed(const Duration(milliseconds: 500));
    return username.length > 3;
  }
}
