import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homely_app/ui/components/custom_buttons.dart';
import 'package:homely_app/ui/screens/login/screen_login.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';
import 'package:lottie/lottie.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static String get name => '/landingScreen';

  @override
  Widget build(BuildContext context) {
    final double padding = CustomThemes.horizontalPadding;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: SvgPicture.asset(
                'assets/images/LandingImage.svg',
                placeholderBuilder: (context) =>
                    LottieBuilder.asset('assets/lottie/loadingAnimation.json'),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('Bienvendio a Homely',
                      style: headline1, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  const Text('La mejor manera de vivir en comunidad!',
                      style: paragraph1, textAlign: TextAlign.center),
                  const SizedBox(height: 40),
                  PrimaryButton(
                    text: 'Login',
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.name);
                    },
                  ),
                  const SizedBox(height: 15),
                  SecondaryButoton(
                    text: 'No tienes cuenta aún?',
                    //TODO: Agregar bottomsheet
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
