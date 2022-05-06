import 'package:flutter/material.dart';
import 'package:homely_app/helpers/common_functions.dart';
import 'package:homely_app/models/clasificado_model.dart';
import 'package:homely_app/ui/components/label_box.dart';
import 'package:homely_app/utils/colors.dart';

class LabelsClasificados extends StatelessWidget {
  const LabelsClasificados({
    Key? key,
    required this.clasificado,
  }) : super(key: key);

  final Clasificado clasificado;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: LabelBox(
                  height: 40,
                  horizontalPadding: 4.0,
                  svgIcon: 'assets/icons/profile.svg',
                  text: clasificado.userUnit,
                  backgroundColor: kBlueBgColor,
                  textColor: kBlueTextColor,
                ),
              ),
              Expanded(
                child: LabelBox(
                  height: 40,
                  horizontalPadding: 4.0,
                  svgIcon: 'assets/icons/clock.svg',
                  text:
                      '${CommonFunctions.daysFromNow(clasificado.createdAt)} días',
                  backgroundColor: kGreenBgColor,
                  textColor: kGreenTextColor,
                ),
              ),
              Expanded(
                child: LabelBox(
                  height: 40,
                  horizontalPadding: 4.0,
                  text: CommonFunctions.isOpenText(clasificado.isOpen),
                  backgroundColor: kRedBgColor,
                  textColor: kRedTextColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        LabelBox(
          height: 40,
          isPhoneCall: true,
          svgIcon: 'assets/icons/message.svg',
          horizontalPadding: 4.0,
          text: clasificado.contactPhone,
          backgroundColor: kPrimaryColorShade4,
          textColor: kPrimaryColor,
        ),
      ],
    );
  }
}