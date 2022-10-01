import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/ui/components/custom_buttons.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String get name => '/login';

  @override
  Widget build(BuildContext context) {
    final padding = CustomThemes.horizontalPadding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Row(
                children: [
                  SquaredWhiteButton(onTap: () => Navigator.pop(context)),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Hola! 👋🏻',
                        style: headline1, textAlign: TextAlign.center),
                    const Text('Bienvenido nuevamente, te hemos extrañamos!',
                        style: paragraph1, textAlign: TextAlign.center),
                    const SizedBox(height: 30),
                    TextField(
                      decoration: const InputDecoration().copyWith(
                        fillColor: kGreyColorShade4,
                        hintText: 'Email',
                        prefixIconConstraints: const BoxConstraints(
                            maxHeight: 30.0, maxWidth: 50.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                              'assets/icons/email-placeholder.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      decoration: const InputDecoration().copyWith(
                        fillColor: kGreyColorShade4,
                        hintText: 'Contraseña',
                        prefixIconConstraints: const BoxConstraints(
                            maxHeight: 30.0, maxWidth: 50.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset(
                              'assets/icons/password-placeholder.svg'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Olvidaste tu contraseña?',
                        style: paragraph5, textAlign: TextAlign.right),
                    const SizedBox(height: 25),
                    PrimaryButton(
                      text: 'Ingresar',
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
