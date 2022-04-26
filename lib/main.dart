import 'package:flutter/material.dart';
import 'package:homely_app/ui/screens/screen_home.dart';
import 'package:homely_app/utils/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homely App',
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.mainTheme,
      initialRoute: HomeScreen.name,
      routes: {
        HomeScreen.name: (_) => const HomeScreen(),
      },
    );
  }
}
