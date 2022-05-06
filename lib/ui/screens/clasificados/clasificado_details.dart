import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/ui/components/clasificados_components/clasificado_image.dart';
import 'package:homely_app/ui/components/clasificados_components/labels_clasificados.dart';
import 'package:homely_app/ui/components/clasificados_components/title_and_price.dart';
import 'package:homely_app/ui/components/custom_buttons.dart';
import 'package:homely_app/utils/colors.dart';
import 'package:homely_app/utils/themes/text_themes.dart';
import 'package:homely_app/utils/themes/themes.dart';

class ClasificadoDetails extends StatelessWidget {
  const ClasificadoDetails({Key? key}) : super(key: key);

  static String get name => '/clasificadoDetails';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Clasificado clasificado =
        ModalRoute.of(context)!.settings.arguments as Clasificado;

    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: '${clasificado.img}${clasificado.createdAt}',
                child: ClasificadoImage(imgURL: clasificado.img, size: size),
              ),
              const SizedBox(height: 15.0),
              ClasificadoDetailedInfo(clasificado: clasificado),
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomThemes.horizontalPadding,
              vertical: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquaredWhiteButton(
                  onTap: () => Navigator.pop(context),
                  hasShadow: true,
                ),
                SquaredWhiteButton(
                  onTap: () {},
                  assetPath: 'assets/icons/heart-empty.svg',
                  hasShadow: true,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class ClasificadoDetailedInfo extends StatelessWidget {
  const ClasificadoDetailedInfo({
    Key? key,
    required this.clasificado,
  }) : super(key: key);

  final Clasificado clasificado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: CustomThemes.horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleAndPrice(clasificado: clasificado),
          const SizedBox(height: 5.0),
          Text(
            'Publicado por ${clasificado.userUnit}',
            style: paragraph6.copyWith(color: kGreyColor),
          ),
          const SizedBox(height: 20.0),
          LabelsClasificados(clasificado: clasificado),
          const SizedBox(height: 20.0),
          const Text('Detalles', style: headline6),
          const SizedBox(height: 10.0),
          Text(
            clasificado.content,
            style: paragraph5,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),
          PrimaryButton(
            text: 'Contactar',
            onTap: () {},
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
