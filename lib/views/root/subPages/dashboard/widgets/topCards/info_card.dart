import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color cardColor;

  const InfoCard(
      {Key? key,
      required this.title,
      required this.value,
      required this.icon,
      required this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 16.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: textStyle3(
                    title, TextAlign.center, ColorManager.whiteColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSpaceHorizontal(3.h),
                Icon(icon, size: 41, color: ColorManager.whiteColor),
                buildSpaceHorizontal(1.w),
                Expanded(
                    child: textStyle4(
                        value, TextAlign.center, ColorManager.whiteColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
