import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/article_model.dart';
import 'package:homely_app/ui/components/articles/article_image.dart';
import 'package:homely_app/ui/components/custom_buttons.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key? key}) : super(key: key);

  static String get name => '/articleDetails';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Article article =
        ModalRoute.of(context)!.settings.arguments as Article;

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: '${article.img}${article.createdAt}',
                child: ArticleImage(imgURL: article.img, size: size),
              ),
              const SizedBox(height: 15.0),
              ClasificadoDetailedInfo(article: article),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomThemes.horizontalPadding,
              vertical: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquaredWhiteButton(
                  onTap: () => Navigator.pop(context),
                  hasShadow: true,
                ),
                SquaredWhiteButton(
                  onTap: () {},
                  assetPath: 'assets/icons/heart-empty.svg',
                  hasShadow: true,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class ClasificadoDetailedInfo extends StatelessWidget {
  const ClasificadoDetailedInfo({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: CustomThemes.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LabelBox(
                text: article.keyWord,
                backgroundColor: kPrimaryColorShade4,
                textColor: kPrimaryColor,
              ),
              const SizedBox(width: 8.0),
              LabelBox(
                text: '${CommonFunctions.daysFromNow(article.createdAt)} dias',
                svgIcon: 'assets/icons/clock.svg',
                backgroundColor: kGreyColorShade4,
                textColor: kGreyColor,
              ),
            ],
          ),

          const SizedBox(height: 10.0),
          Text(article.title, style: headline3),
          // LabelsClasificados(article: article),
          const SizedBox(height: 10.0),
          Text(
            'Publicado por ${article.userUnit}',
            style: paragraph6.copyWith(color: kGreyColor),
          ),
          const SizedBox(height: 10.0),
          const Text('Detalles', style: headline6),
          const SizedBox(height: 10.0),
          Text(
            article.content,
            style: paragraph5,
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
