import 'package:flutter/material.dart';
import 'package:homely_app/models/article_model.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/models/facility_model.dart';
import 'package:homely_app/ui/components/bottom_navigation_bar.dart';
import 'package:homely_app/ui/components/custom_app_bar.dart';
import 'package:homely_app/ui/components/home_components/explore_button.dart';
import 'package:homely_app/ui/components/home_components/home_clasificados_cards.dart';
import 'package:homely_app/ui/components/home_components/home_cta_button.dart';
import 'package:homely_app/ui/components/home_components/home_news_cards.dart';
import 'package:homely_app/ui/components/home_components/home_reservations_cards.dart';
import 'package:homely_app/ui/components/home_components/home_section_header.dart';
import 'package:homely_app/ui/screens/articles/screen_articles.dart';
import 'package:homely_app/ui/screens/clasificados/screen_clasificados.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String get name => '/home';

  @override
  Widget build(BuildContext context) {
    final padding = CustomThemes.horizontalPadding;

    return Scaffold(
      appBar: const CustomAppBar(
          title: 'Sebastián Arias', subtitle: 'Bienvenido 👋🏻'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // HomeExploreButtons(padding: padding),

            HomeCTAButton(padding: padding),
            HomeSectionHeader(
              title: 'Últimas Noticias',
              onTap: () => Navigator.pushNamed(context, ArticlesScreen.name),
            ),
            HomeNewsList(articles: Article.testingArticles),
            HomeSectionHeader(title: 'Reserva Zonas Comunes', onTap: () {}),
            HomeReservationsList(facilities: Facility.testingFacilities),
            HomeSectionHeader(
              title: 'Últimos Clasificados',
              onTap: () =>
                  Navigator.pushNamed(context, ClasificadosScreen.name),
            ),
            HomeClasificadosList(clasificados: Clasificado.testingClasificados),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class HomeExploreButtons extends StatelessWidget {
  const HomeExploreButtons({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding, top: 20),
      child: Column(
        children: [
          Row(
            children: const [
              ExploreButton(
                color: kArticlesColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/message-text.svg',
                text: 'Noticias',
              ),
              ExploreButton(
                color: kClasificadosColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/document.svg',
                text: 'Clasific',
              ),
              ExploreButton(
                color: kDirectoryColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/directory-inactive.svg',
                text: 'Directorio',
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              ExploreButton(
                color: kReservationsColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/message-text.svg',
                text: 'Reservas',
              ),
              ExploreButton(
                color: kPQRSColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/pqrs-inactive.svg',
                text: 'PQRS',
              ),
              ExploreButton(
                color: kOtherColor,
                screen: Text('News Screen'),
                svgIcon: 'assets/icons/others-inactive.svg',
                text: 'Otros',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
