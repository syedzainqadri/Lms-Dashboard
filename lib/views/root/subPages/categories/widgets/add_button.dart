import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:sizer/sizer.dart';

Widget addButton(String text, isSmall) {
  return Container(
    height: 6.h,
    width: isSmall ? 20.w : 12.w,
    decoration: BoxDecoration(
      color: ColorManager.primaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      boxShadow: [
        BoxShadow(
          color: ColorManager.primaryColor.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
          color: ColorManager.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
