import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:sizer/sizer.dart';

Widget actionButton(String text, bool isLarge) {
  return Container(
    height: isLarge ? 7.h : 5.h,
    width: isLarge ? 25.w : 40.w,
    decoration: BoxDecoration(
      color: ColorManager.primaryColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
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
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
