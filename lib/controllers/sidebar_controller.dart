import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/assets_manager.dart';

class SideBarController extends GetxController {
  final List<String> iconsList = [
    AssetImages.dashboard,
    AssetImages.menuStore,
    AssetImages.menuDoc,
    AssetImages.menuTask,
    AssetImages.menuTask,
    AssetImages.menuTask,
  ];
  final List<String> namesList = [
    // 'Dashboard',
    "Events",
    "Programs",
    "Banners",
    "Donations",
    "Feedbacks",
    "Volunteers",
    // "FeedBacks",
    // "Donations",
  ];

  final _pageController = PageController().obs;
  PageController get pageController => _pageController.value;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  onSelected(int index) {
    _pageController.value.jumpToPage(index);
    _pageController.value = pageController;
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
