import 'package:flutter/material.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class LabelBox extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const LabelBox({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
      ),
      child: Text(
        text,
        style: paragraph6.copyWith(color: textColor),
      ),
    );
  }
}
