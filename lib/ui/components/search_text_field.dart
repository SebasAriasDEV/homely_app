import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: CustomThemes.horizontalPadding, vertical: 15.0),
      child: TextFormField(
        decoration: const InputDecoration().copyWith(
          hintText: 'Buscar...',
          hintStyle: paragraph3.copyWith(color: kGreyColor),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 30.0, maxWidth: 50.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset('assets/icons/search-icon.svg'),
          ),
        ),
      ),
    );
  }
}
