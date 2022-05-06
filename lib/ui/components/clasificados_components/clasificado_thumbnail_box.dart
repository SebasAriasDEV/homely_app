import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/ui/components/icon_text_label.dart';
import 'package:homely_app/ui/components/thumbnail_image.dart';
import 'package:homely_app/ui/screens/clasificados/clasificado_details.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class ClasificadoThumbnailBox extends StatelessWidget {
  final Clasificado clasificado;

  const ClasificadoThumbnailBox({
    Key? key,
    required this.clasificado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = CommonFunctions.daysFromNow(clasificado.createdAt);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ClasificadoDetails.name,
          arguments: clasificado),
      child: Container(
        height: 120,
        margin:
            EdgeInsets.symmetric(horizontal: CustomThemes.horizontalPadding),
        padding: const EdgeInsets.only(
            left: 6.0, bottom: 6.0, top: 6.0, right: 13.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Hero(
              tag: '${clasificado.img}${clasificado.createdAt}',
              child: ThumbnailImage(imgURL: clasificado.img),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    clasificado.title,
                    style: headline6,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextLabel(
                        iconPath: 'assets/icons/message.svg',
                        text: clasificado.contactPhone,
                      ),
                      IconTextLabel(
                        iconPath: 'assets/icons/profile.svg',
                        text: clasificado.userUnit,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextLabel(
                          iconPath: 'assets/icons/clock.svg',
                          text: '$days dias',
                        ),
                        Expanded(
                          child: Text(
                            CommonFunctions.numberAsCurrency(clasificado.price),
                            style: headline6.copyWith(color: kPrimaryColor),
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
