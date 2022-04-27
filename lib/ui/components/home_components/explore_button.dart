import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class ExploreButton extends StatelessWidget {
  final Color color;
  final String text;
  final Widget screen;
  final String svgIcon;

  const ExploreButton({
    Key? key,
    required this.color,
    required this.text,
    required this.screen,
    required this.svgIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: MaterialButton(
          onPressed: () {},
          color: color,
          elevation: 0.0,
          height: 48,
          minWidth: 100,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIcon,
                color: kWhiteColor,
                width: 16,
              ),
              const SizedBox(width: 3),
              Text(
                text,
                style: paragraph2.copyWith(color: kWhiteColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
