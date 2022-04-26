import 'package:flutter/material.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class HomeSectionHeader extends StatelessWidget {
  final String buttonText;
  final String title;
  final Function onTap;

  const HomeSectionHeader({
    Key? key,
    this.buttonText = 'Ver Más',
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = CustomThemes.horizontalPadding;
    return Padding(
      padding: EdgeInsets.only(left: padding, right: padding, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: headline6),
          TextButton(
            child: Text(buttonText,
                style: headline8.copyWith(color: kPrimaryColor)),
            onPressed: () => onTap,
          ),
        ],
      ),
    );
  }
}
