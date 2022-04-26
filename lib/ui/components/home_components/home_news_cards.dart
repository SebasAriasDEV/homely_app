import 'package:flutter/material.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeNewsList extends StatelessWidget {
  const HomeNewsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const _HomeNewsCard(
              labelText1: 'Zonas Comunes', daysText: '5 dias', imageURL: 'https://images.pexels.com/photos/443383/pexels-photo-443383.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=500&w=700',),
        ),
      ),
    );
  }
}

class _HomeNewsCard extends StatelessWidget {
  final String labelText1;
  final String daysText;
  final String? imageURL;

  const _HomeNewsCard({
    Key? key,
    required this.labelText1,
    required this.daysText,
    this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 106,
          width: 188,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              imageURL!,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Nueva compañia de segurirad desde Febrero 2022',
          style: headline8,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelBox(
              text: labelText1,
              backgroundColor: kPrimaryColorShade4,
              textColor: kPrimaryColor,
            ),
            LabelBox(
              text: daysText,
              backgroundColor: kGreyColorShade4,
              textColor: kGreyColor,
            ),
          ],
        )
      ],
    );
  }
}