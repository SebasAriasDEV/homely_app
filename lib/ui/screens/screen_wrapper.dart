import 'package:flutter/material.dart';
import 'package:homely_app/providers/auth_provider.dart';
import 'package:homely_app/ui/screens/login/screen_landing.dart';

import 'package:homely_app/ui/screens/screen_home.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  static String get name => '/wrapper';

  @override
  Widget build(BuildContext context) {
    final AuthProvider _authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return FutureBuilder<bool>(
      future: _authProvider.validateLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return const HomeScreen();
          } else {
            return const LandingScreen();
          }
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                    '/Users/sebastianarias/StudioProjects/HOMELY-APP/homely_app/assets/lottie/loadingAnimation.json'),
              ],
            ),
          ),
        );
      },
    );
  }
}
