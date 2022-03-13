import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/sidebar_controller.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/sidebar/desktop_sidebar.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/views/root/sidebar/tablet_desktop.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/categories_page.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/dashboard_page.dart';
import 'package:lmsadminpanle/views/root/subPages/invoiceOrders/invoice_orders_page.dart';
import 'package:lmsadminpanle/views/root/subPages/orders/orders_page.dart';
import 'package:lmsadminpanle/views/root/subPages/products/products_page.dart';
import 'package:lmsadminpanle/views/root/subPages/reservation/reservation_page.dart';
import 'package:lmsadminpanle/views/root/subPages/settings/settings_page.dart';
import 'package:lmsadminpanle/views/root/subPages/users/users_page.dart';
import 'package:sizer/sizer.dart';
import 'sidebar/mobile_sidebar.dart';

class RootView extends StatelessWidget {
  RootView({Key? key}) : super(key: key);

  final SideBarController _sideBarController = Get.put(SideBarController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _sideBarController.scaffoldKey,
      drawer: size < 500
          ? MobileSidebar(sideBarController: _sideBarController)
          : null,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorManager.primaryColor),
        automaticallyImplyLeading: size < 500 ? true : false,
        actions: [
          Row(
            children: [
              const Icon(Icons.logout,
                  size: 20, color: ColorManager.primaryColor),
              textStyle2("Logout", TextAlign.right, ColorManager.primaryColor),
              buildSpaceHorizontal(2.w),
            ],
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size >= 920
                ? size * 0.2
                : size > 600
                    ? size * 0.1
                    : 0,
            child: size >= 920
                ? DesktopSidebar(sideBarController: _sideBarController)
                : size > 600
                    ? TabletSidebar(sideBarController: _sideBarController)
                    : null,
          ),
          SizedBox(
            width: size > 920
                ? size * 0.8
                : size > 600
                    ? size * 0.9
                    : size,
            child: PageView(
              controller: _sideBarController.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DashboardPage(),
                const CategoriesPage(),
                const ProductsPage(),
                const UsersPage(),
                const ReservationsPage(),
                const OrdersPage(),
                const InvoiceOrdersPage(),
                const SettingsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//sideBarController.widgetList.length