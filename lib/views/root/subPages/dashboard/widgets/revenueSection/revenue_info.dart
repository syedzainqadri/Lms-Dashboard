import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/font_manager.dart';

class RevenueInfo extends StatelessWidget {
  final String title;
  final String amount;
  final bool isLarge;

  const RevenueInfo(
      {Key? key,
      required this.title,
      required this.amount,
      required this.isLarge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "$title \n",
              style: GoogleFonts.openSans(
                fontSize: isLarge ? FontSize.s16 : FontSize.s10,
                color: ColorManager.primaryColor,
                fontWeight: isLarge
                    ? FontWeightManager.regular
                    : FontWeightManager.medium,
              )),
          TextSpan(
              text: amount,
              style: GoogleFonts.openSans(
                fontSize: isLarge ? FontSize.s24 : FontSize.s12,
                color: ColorManager.primaryColor,
                fontWeight:
                    isLarge ? FontWeightManager.bold : FontWeightManager.medium,
              )),
        ]),
      ),
    );
  }
}
