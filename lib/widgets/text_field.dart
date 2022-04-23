import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  final TextInputType inputType;
  final bool isEnable;
  final int inputLines;
  final Color color;
  final bool isPass;
  final bool isLarge;
  late bool passwordVisibility;

  CustomTextField({
    Key? key,
    this.controller,
    this.hintName,
    this.isPass = false,
    this.passwordVisibility = false,
    required this.isLarge,
    this.inputType = TextInputType.text,
    this.isEnable = true,
    this.inputLines = 1,
    this.color = ColorManager.whiteColor,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isLarge ? AppPadding.p20 : AppPadding.p6),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPass ? !widget.passwordVisibility : false,
        enabled: widget.isEnable,
        keyboardType: widget.inputType,
        maxLines: widget.inputLines,
        style: const TextStyle(fontSize: AppSize.s12, fontWeight: FontWeight.normal),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hintName}';
          }
          return null;
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
            borderSide: BorderSide(color: ColorManager.grayColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
            borderSide: BorderSide(color: ColorManager.grayColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
            borderSide: BorderSide(color: ColorManager.redColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
            borderSide: BorderSide(color: ColorManager.redColor),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
            borderSide: BorderSide(color: ColorManager.grayColor),
          ),
          suffixIcon: widget.isPass
              ? IconButton(
                  icon: Icon(
                    widget.passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: ColorManager.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.passwordVisibility = !widget.passwordVisibility;
                    });
                  },
                )
              : const SizedBox.shrink(),
          hintText: widget.hintName,
          // hintStyle: TextStyle(fontSize: 10),
          hintStyle: TextStyle(fontSize: widget.isLarge ? AppSize.s10 : AppSize.s8),

          fillColor: widget.color,
          filled: true,
        ),
      ),
    );
  }
}
