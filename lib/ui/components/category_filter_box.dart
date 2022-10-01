import 'package:flutter/material.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class CategoryFilterBox extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryFilterBox({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: isSelected ? kPrimaryColor : kWhiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(text,
            style: paragraph2.copyWith(
                color: isSelected ? kWhiteColor : kGreyColor)),
      ),
    );
  }
}
