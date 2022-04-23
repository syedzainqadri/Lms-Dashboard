import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/events/widgets/add_button.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class TopCard extends StatelessWidget {
  final String title, buttonText;
  // final Function onTap;
  final bool isSmall;
  const TopCard(
      {Key? key,
      required this.title,
      required this.buttonText,
      required this.isSmall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var onclick = onTap();
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textStyle6(title, TextAlign.left, ColorManager.primaryColor),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // textStyle3("Export", TextAlign.center, ColorManager.primaryColor),
              // buildSpaceHorizontal(1.w),
              // textStyle3("Import", TextAlign.center, ColorManager.primaryColor),
              // buildSpaceHorizontal(1.w),
              InkWell(
                  onTap: () {
                    Get.toNamed('/addCat');
                  },
                  child: addButton(buttonText, isSmall)),
              buildSpaceHorizontal(1.w),
            ],
          ),
        ],
      ),
    );
  }
}
