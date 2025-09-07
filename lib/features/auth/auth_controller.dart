import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

class AuthController {
  final Ref ref;

  AuthController(this.ref);

  Future<void> signInWithGoogleMock() async {
    // simulate delay
    await Future.delayed(const Duration(seconds: 1));
    // You can store auth state here if needed
  }
}
