import 'package:flutter/material.dart';
import 'package:homely_app/ui/components/custom_app_bar.dart';
import 'package:homely_app/ui/components/home_components/home_clasificados_cards.dart';
import 'package:homely_app/ui/components/home_components/home_cta_button.dart';
import 'package:homely_app/ui/components/home_components/home_news_cards.dart';
import 'package:homely_app/ui/components/home_components/home_reservations_cards.dart';
import 'package:homely_app/ui/components/home_components/home_section_header.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String get name => '/home';

  @override
  Widget build(BuildContext context) {
    final padding = CustomThemes.horizontalPadding;

    return Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeCTAButton(padding: padding),
              HomeSectionHeader(title: 'Últimas Noticias', onTap: () {}),
              const HomeNewsList(),
              HomeSectionHeader(title: 'Reserva Zonas Comunes', onTap: () {}),
              const HomeReservationsList(),
              HomeSectionHeader(title: 'Últimos Clasificados', onTap: () {}),
              const HomeClasificadosList(),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
