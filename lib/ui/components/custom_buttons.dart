import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 5.0,
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () => onTap(),
          color: isLoading ? kGreyColorShade2 : kPrimaryColor,
          height: 56,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: isLoading
              ? const CircularProgressIndicator(color: kGreyColor)
              : Text(text, style: headline6.copyWith(color: kWhiteColor)),
        ),
      ),
    );
  }
}

class SecondaryButoton extends StatelessWidget {
  final String text;
  final Function onTap;

  const SecondaryButoton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 5.0,
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () => onTap(),
          //color: kPrimaryColor,
          height: 56,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(text, style: headline6.copyWith(color: kPrimaryColor)),
        ),
      ),
    );
  }
}

//Boton pequeño para regresar a la pantalla anterior (con animacion)
class SquaredWhiteButton extends StatelessWidget {
  final String assetPath;
  final Function onTap;
  final bool hasShadow;

  const SquaredWhiteButton({
    Key? key,
    required this.onTap,
    this.hasShadow = false,
    this.assetPath = 'assets/icons/arrow-left.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      from: 5.0,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: hasShadow
                ? [
                    BoxShadow(
                      color: kBlackColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),
                  ]
                : null,
          ),
          child: SvgPicture.asset(
            assetPath,
            width: 24,
            height: 24,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
