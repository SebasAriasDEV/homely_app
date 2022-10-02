import 'package:flutter/material.dart';
import 'package:homely_app/providers/auth_provider.dart';
import 'package:homely_app/providers/login_provider.dart';
import 'package:homely_app/ui/screens/articles/article_details.dart';
import 'package:homely_app/ui/screens/articles/screen_articles.dart';
import 'package:homely_app/ui/screens/clasificados/clasificado_details.dart';
import 'package:homely_app/ui/screens/clasificados/screen_clasificados.dart';
import 'package:homely_app/ui/screens/login/screen_landing.dart';
import 'package:homely_app/ui/screens/login/screen_login.dart';
import 'package:homely_app/ui/screens/screen_home.dart';
import 'package:homely_app/ui/screens/screen_test.dart';
import 'package:homely_app/ui/screens/screen_wrapper.dart';
import 'package:homely_app/utils/themes/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Homely App',
        debugShowCheckedModeBanner: false,
        theme: CustomThemes.mainTheme,
        initialRoute: WrapperScreen.name,
        routes: {
          HomeScreen.name: (_) => const HomeScreen(),
          ClasificadosScreen.name: (_) => const ClasificadosScreen(),
          ClasificadoDetails.name: (_) => const ClasificadoDetails(),
          ArticlesScreen.name: (_) => const ArticlesScreen(),
          ArticleDetails.name: (_) => const ArticleDetails(),
          LoginScreen.name: (_) => const LoginScreen(),
          LandingScreen.name: (_) => const LandingScreen(),
          WrapperScreen.name: (_) => const WrapperScreen(),
          '/test': (_) => const Test(),
        },
      ),
    );
  }
}
