import 'package:flutter/material.dart';
import 'package:homely_app/models/facility_model.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeReservationsList extends StatelessWidget {
  final List<Facility> facilities;

  const HomeReservationsList({
    Key? key,
    required this.facilities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: facilities.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) =>
            _HomeReservationCard(facility: facilities[index]),
      ),
    );
  }
}

class _HomeReservationCard extends StatelessWidget {
  final Facility facility;

  const _HomeReservationCard({Key? key, required this.facility})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(facility.img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(facility.name,
                      style: headline7.copyWith(color: kWhiteColor)),
                  Text('${facility.startTimeUtc} - ${facility.endTimeUtc}',
                      style: paragraph6.copyWith(color: kWhiteColor)),
                ],
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  colors: [kBlackColor.withOpacity(0.92), kBlackColor.withOpacity(0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, 0.6],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              padding: const EdgeInsets.only(bottom: 12.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(facility.name,
                      style: headline7.copyWith(color: kWhiteColor)),
                  Text('${facility.startTimeUtc} - ${facility.endTimeUtc}',
                      style: paragraph6.copyWith(color: kWhiteColor)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
