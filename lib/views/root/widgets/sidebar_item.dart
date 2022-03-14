import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem(
      {Key? key,
      this.title,
      required this.svgSrc,
      required this.press,
      required this.isTablet})
      : super(key: key);
  final String? title;
  final String svgSrc;
  final VoidCallback press;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return isTablet
        ? ListTile(
            onTap: press,
            leading: SvgPicture.asset(svgSrc,
                color: ColorManager.sidebarMenuColor, height: AppSize.s20))
        : ListTile(
            onTap: press,
            horizontalTitleGap: AppSize.s0,
            leading: SvgPicture.asset(svgSrc,
                color: ColorManager.sidebarMenuColor, height: AppSize.s16),
            title: textStyle2(
                title!, TextAlign.left, ColorManager.sidebarMenuColor));
  }
}
