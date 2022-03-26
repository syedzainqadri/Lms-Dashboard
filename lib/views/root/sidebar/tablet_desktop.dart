import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/sidebar_controller.dart';
import 'package:lmsadminpanle/utils/constants/assets_manager.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/views/root/widgets/sidebar_item.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TabletSidebar extends StatelessWidget {
  SideBarController sideBarController;
  TabletSidebar({Key? key, required this.sideBarController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: ColorManager.darkColor,
      child: Container(
        color: ColorManager.darkColor,
        child: Column(
          children: [
            buildSpaceVertical(4.h),
            Image.asset(AssetImages.logo, height: 6.h, width: 10.w),
            buildSpaceVertical(2.h),
            const Divider(thickness: 2, color: ColorManager.primaryColor),
            buildSpaceVertical(4.h),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: true,
                    press: () {
                      sideBarController.onSelected(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
