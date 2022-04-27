import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: paragraph6,
        unselectedLabelStyle: paragraph6,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kGreyColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/message-question.svg'),
            label: 'PQRS',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/route-square.svg'),
            label: 'Directory',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/more-circle.svg'),
            label: 'Others',
          ),
        ],
      );
  }
}