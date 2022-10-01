import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/article_model.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/ui/components/thumbnail_image.dart';
import 'package:homely_app/ui/screens/articles/article_details.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class ArticleThumbnailBox extends StatelessWidget {
  final Article article;

  const ArticleThumbnailBox({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = CommonFunctions.daysFromNow(article.createdAt);

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, ArticleDetails.name, arguments: article),
      child: Container(
        height: 116,
        margin:
            EdgeInsets.symmetric(horizontal: CustomThemes.horizontalPadding),
        padding: const EdgeInsets.only(
            left: 13.0, bottom: 6.0, top: 6.0, right: 6.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
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
                        text: days,
                        svgIcon: 'assets/icons/clock.svg',
                        backgroundColor: kGreyColorShade4,
                        textColor: kGreyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    article.title,
                    style: headline6,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            Hero(
              tag: '${article.img}${article.createdAt}',
              child: ThumbnailImage(imgURL: article.img),
            ),
          ],
        ),
      ),
    );
  }
}
