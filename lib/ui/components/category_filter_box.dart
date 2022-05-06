import 'package:flutter/material.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class CategoryFilterBox extends StatelessWidget {
  const CategoryFilterBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text('Apartamentos',
            style: paragraph2.copyWith(color: kWhiteColor)),
      ),
    );
  }
}
