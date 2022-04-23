import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/sidebar_controller.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/sidebar/desktop_sidebar.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/views/root/sidebar/tablet_desktop.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/banners_page.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/categories_page.dart';
import 'package:lmsadminpanle/views/root/subPages/donations/donations_screen.dart';
import 'package:sizer/sizer.dart';
import 'sidebar/mobile_sidebar.dart';
import 'subPages/feedback/feedbacks_screen.dart';
import 'subPages/volunteer/volunteers_screen.dart';

class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final SideBarController _sideBarController = Get.put(SideBarController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _sideBarController.scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorManager.darkColor,
        elevation: 0,
        // iconTheme: const IconThemeData(color: ColorManager.whiteColor),
        // automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              show = !show;
            });
            if(size > 200 && size < 500) {
              _sideBarController.scaffoldKey.currentState?.openDrawer();
              print("here");
            }
          },
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.logout, size: 20, color: ColorManager.whiteColor),
              textStyle2("Logout", TextAlign.right, ColorManager.whiteColor),
              buildSpaceHorizontal(2.w),
            ],
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size >= 920 ? show == true ? size * 0.15 : 0 : size > 600 ? show == true ? size * 0.1 : 0 : 0,
            child: size >= 920 ? show == true ? DesktopSidebar(sideBarController: _sideBarController) : MobileSidebar(sideBarController: _sideBarController)
                : size > 600 ? show == true ? TabletSidebar(sideBarController: _sideBarController) : MobileSidebar(sideBarController: _sideBarController) : null,
          ),
          SizedBox(
            width: size > 920 ? show == true ? size * 0.85 : size : size > 600 ? show == true ? size * 0.9 : size : size,
            child: PageView(
              controller: _sideBarController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                CategoriesPage(),
                BannersPage(),
                DonationsPage(),
                FeedbacksPage(),
                VolunteersPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//sideBarController.widgetList.length