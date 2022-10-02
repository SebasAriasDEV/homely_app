import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/providers/login_provider.dart';
import 'package:homely_app/ui/components/custom_buttons.dart';
import 'package:homely_app/ui/screens/screen_home.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String get name => '/login';

  @override
  Widget build(BuildContext context) {
    final LoginProvider _loginProvider = Provider.of<LoginProvider>(context);
    final padding = CustomThemes.horizontalPadding;

    //Functions
    Future<void> loginUser() async {
      String loginResponse = await _loginProvider.loginUser();
      if (loginResponse == 'OK') {
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.name, (route) => false);
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: loginResponse,
            backgroundColor: kRedTextColor,
          ),
        );
      }
    }

    //Body
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
                    const LoginTextFields(),
                    const SizedBox(height: 10),
                    const Text('Olvidaste tu contraseña?',
                        style: paragraph5, textAlign: TextAlign.right),
                    const SizedBox(height: 25),
                    PrimaryButton(
                      text: 'Ingresar',
                      isLoading: _loginProvider.loading,
                      onTap: () => _loginProvider.loading ? null : loginUser(),
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

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    final LoginProvider _loginProvider =
        Provider.of<LoginProvider>(context, listen: false);

    _emailController
        .addListener(() => _loginProvider.email = _emailController.text);
    _passwordController
        .addListener(() => _loginProvider.password = _passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          style: paragraph2,
          decoration: const InputDecoration().copyWith(
            fillColor: kGreyColorShade4,
            hintText: 'Email',
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 30.0, maxWidth: 50.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset('assets/icons/email-placeholder.svg'),
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _passwordController,
          style: paragraph2,
          decoration: const InputDecoration().copyWith(
            fillColor: kGreyColorShade4,
            hintText: 'Contraseña',
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 30.0, maxWidth: 50.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset('assets/icons/password-placeholder.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
