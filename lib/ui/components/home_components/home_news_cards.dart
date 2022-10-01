import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/article_model.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/ui/screens/articles/article_details.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeNewsList extends StatelessWidget {
  final List<Article> articles;

  const HomeNewsList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: _HomeNewsCard(article: articles[index]),
        ),
      ),
    );
  }
}

class _HomeNewsCard extends StatelessWidget {
  final Article article;

  const _HomeNewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = CommonFunctions.daysFromNow(article.createdAt);

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, ArticleDetails.name, arguments: article),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: '${article.img}${article.createdAt}',
            child: SizedBox(
              height: 106,
              width: 188,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  article.img,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            article.title,
            style: headline8,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelBox(
                text: article.keyWord,
                backgroundColor: kPrimaryColorShade4,
                textColor: kPrimaryColor,
              ),
              LabelBox(
                text: '$days dias',
                svgIcon: 'assets/icons/clock.svg',
                backgroundColor: kGreyColorShade4,
                textColor: kGreyColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
