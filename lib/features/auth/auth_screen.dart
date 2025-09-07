import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jignasa_album_practical/constants/image_constants.dart';
import 'package:jignasa_album_practical/constants/route_constants.dart';
import 'package:jignasa_album_practical/constants/text_constants.dart';

import 'auth_controller.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await ref
                        .read(authControllerProvider)
                        .signInWithGoogleMock();
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, RouteConstants.loading);
                    }
                  },
                  child: Image.asset(ImageConstants.googleSignIn),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
