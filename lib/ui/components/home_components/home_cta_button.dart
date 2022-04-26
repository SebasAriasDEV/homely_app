import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class HomeCTAButton extends StatelessWidget {
  const HomeCTAButton({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 56,
        margin: EdgeInsets.only(left: padding, right: padding, top: padding),
        padding: EdgeInsets.symmetric(horizontal: padding),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('You have 1 active reservation',
                style: paragraph2.copyWith(color: kWhiteColor)),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/arrow-right.svg'),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
