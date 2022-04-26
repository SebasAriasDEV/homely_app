import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class IconTextLabel extends StatelessWidget {
  final String iconPath;
  final String text;

  const IconTextLabel({
    Key? key,
    required this.iconPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          color: kGreyColor,
          width: 12,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: paragraph6.copyWith(color: kGreyColor),
        )
      ],
    );
  }
}
