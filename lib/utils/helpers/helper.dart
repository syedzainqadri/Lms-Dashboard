import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';

successToast(String title, String msg) {
  Get.snackbar(
    title,
    msg,
    backgroundColor: ColorManager.primaryColor,
    colorText: ColorManager.whiteColor,
    snackPosition: SnackPosition.TOP,
  );
}

errorToast(String title, String msg) {
  Get.snackbar(
    title,
    msg,
    backgroundColor: ColorManager.redColor,
    colorText: ColorManager.whiteColor,
    snackPosition: SnackPosition.TOP,
  );
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}

SizedBox buildSpaceVertical(height) => SizedBox(height: height);
SizedBox buildSpaceHorizontal(width) => SizedBox(width: width);
