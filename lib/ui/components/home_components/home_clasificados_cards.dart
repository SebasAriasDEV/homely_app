import 'package:flutter/material.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/ui/components/icon_text_label.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeClasificadosList extends StatelessWidget {
  final List<Clasificado> clasificados;

  const HomeClasificadosList({
    Key? key,
    required this.clasificados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 227,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: CustomThemes.horizontalPadding),
        scrollDirection: Axis.horizontal,
        itemCount: clasificados.length,
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemBuilder: (_, index) => Container(
          width: 200,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: _HomeClasificadoCard(clasificado: clasificados[index]),
        ),
      ),
    );
  }
}

class _HomeClasificadoCard extends StatelessWidget {
  final Clasificado clasificado;
  const _HomeClasificadoCard({
    Key? key,
    required this.clasificado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var days = DateTime.now()
        .toUtc()
        .difference(clasificado.createdAt)
        .inDays
        .toString();

    int.parse(days) >= 999 ? days = '999' : days = days;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 106,
          width: 188,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(clasificado.img, fit: BoxFit.fill),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          clasificado.title,
          style: headline8,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextLabel(
              text: clasificado.contactPhone,
              iconPath: 'assets/icons/message.svg',
            ),
            IconTextLabel(
              text: clasificado.userUnit,
              iconPath: 'assets/icons/profile.svg',
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelBox(
              text: clasificado.type,
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
        ),
      ],
    );
  }
}
