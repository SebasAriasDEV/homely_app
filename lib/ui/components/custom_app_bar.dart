import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = CustomThemes.horizontalPadding;

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(left: padding, right: padding, top: 10.0),
        child: Row(
          children: [
            const _ProfileAvatar(),
            const SizedBox(width: 15),
            const _AppBarTexts(
              smallText: 'Bienvenido 👋🏻',
              title: 'Sebastián Arias',
            ),
            Expanded(child: Container()),
            const _AppBarNotifButton(hasNotification: true),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(58); //48
}

class _AppBarNotifButton extends StatelessWidget {
  final bool hasNotification;

  const _AppBarNotifButton({
    Key? key,
    this.hasNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/notificationIcon.svg',
            width: 24,
            height: 24,
            fit: BoxFit.none,
          ),
          hasNotification
              ? Positioned(
                  left: 24,
                  top: 12,
                  child: Container(
                    height: 11,
                    width: 11,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kErrorColor,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

class _AppBarTexts extends StatelessWidget {
  final String smallText;
  final String title;

  const _AppBarTexts({
    Key? key,
    required this.smallText,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(smallText, style: paragraph7),
        Text(title, style: headline4),
      ],
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: kGreyColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(
            '/Users/sebastianarias/StudioProjects/HOMELY-APP/homely_app/assets/images/Profile.jpg'),
      ),
    );
  }
}
