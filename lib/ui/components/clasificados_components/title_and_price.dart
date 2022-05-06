import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.clasificado,
  }) : super(key: key);

  final Clasificado clasificado;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(clasificado.title, style: headline4),
        ),
        Expanded(
          child: FittedBox(
            child: Text(
              CommonFunctions.numberAsCurrency(clasificado.price),
              style: headline4.copyWith(color: kPrimaryColor),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
