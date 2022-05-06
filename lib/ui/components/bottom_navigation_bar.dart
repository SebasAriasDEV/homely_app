import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedLabelStyle: paragraph6,
      unselectedLabelStyle: paragraph6,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kGreyColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/icons/home-active.svg',
              color: kPrimaryColor),
          icon: SvgPicture.asset('assets/icons/home-inactive.svg',
              color: kGreyColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/icons/pqrs-active.svg',
              color: kPrimaryColor),
          icon: SvgPicture.asset('assets/icons/pqrs-inactive.svg',
              color: kGreyColor),
          label: 'PQRS',
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/icons/directory-active.svg',
              color: kPrimaryColor),
          icon: SvgPicture.asset('assets/icons/directory-inactive.svg',
              color: kGreyColor),
          label: 'Directory',
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset('assets/icons/others-active.svg',
              color: kPrimaryColor),
          icon: SvgPicture.asset('assets/icons/others-inactive.svg',
              color: kGreyColor),
          label: 'Others',
        ),
      ],
    );
  }
}
