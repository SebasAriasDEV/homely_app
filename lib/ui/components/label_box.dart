import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class LabelBox extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String? svgIcon;
  final double? height;
  final double? horizontalPadding;
  final bool isPhoneCall;

  const LabelBox({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.height,
    this.horizontalPadding,
    this.svgIcon,
    this.isPhoneCall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            svgIcon != null
                ? SvgPicture.asset(svgIcon!, color: textColor)
                : const SizedBox(),
            svgIcon != null ? const SizedBox(width: 2) : const SizedBox(),
            Text(
              text,
              style: paragraph6.copyWith(color: textColor),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            isPhoneCall ? const SizedBox(width: 8.0) : const SizedBox(),
            isPhoneCall
                ? MaterialButton(
                    onPressed: () {},
                    color: kPrimaryColor,
                    elevation: 0.0,
                    textColor: kWhiteColor,
                    child: Text('Llamar',
                        style: paragraph6.copyWith(color: kWhiteColor)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
