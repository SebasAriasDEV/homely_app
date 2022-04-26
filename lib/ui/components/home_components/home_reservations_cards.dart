import 'package:flutter/material.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeReservationsList extends StatelessWidget {
  const HomeReservationsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => const _HomeReservationCard(
          labelText1: 'Zonas Comunes',
          daysText: '5 dias',
          imageURL:
              'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
        ),
      ),
    );
  }
}

class _HomeReservationCard extends StatelessWidget {
  final String labelText1;
  final String daysText;
  final String? imageURL;

  const _HomeReservationCard({
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
        Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.only(bottom: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: NetworkImage(imageURL!),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Gimnasio', style: headline7.copyWith(color: kWhiteColor)),
              Text('08:00 - 20:00',
                  style: paragraph6.copyWith(color: kWhiteColor)),
            ],
          ),
        ),
      ],
    );
  }
}
