import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/font_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({Key? key}) : super(key: key);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _catNameController = TextEditingController();
  final _skuController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var selectedCatStatus = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: size.width > 968 ? size.height * 0.65 : size.height * 0.72,
        width: size.width * 0.7,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSpaceVertical(2.h),
              Center(
                  child: textStyle4("Add New Category", TextAlign.center,
                      ColorManager.primaryColor)),
              buildSpaceVertical(2.h),
              CustomTextField(
                controller: _catNameController,
                hintName: StringsManager.category,
                icon: Icons.category,
                isLarge: size.width > 800 ? true : false,
              ),
              buildSpaceVertical(2.h),
              CustomTextField(
                controller: _skuController,
                hintName: StringsManager.sku,
                icon: Icons.description,
                isLarge: size.width > 800 ? true : false,
              ),
              buildSpaceVertical(2.h),
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20),
                child: textStyle3(StringsManager.catStatus, TextAlign.center,
                    ColorManager.primaryColor),
              ),
              buildSpaceVertical(2.h),
              size.width > 968
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            child: RadioListTile(
                                activeColor: ColorManager.primaryColor,
                                contentPadding:
                                    const EdgeInsets.only(right: 1.0),
                                title: textStyle3(
                                    StringsManager.catStatusA,
                                    TextAlign.center,
                                    ColorManager.primaryColor),
                                value: 0,
                                groupValue: selectedCatStatus,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCatStatus =
                                        int.parse(value.toString());
                                  });
                                }),
                          ),
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                            child: RadioListTile(
                                activeColor: ColorManager.primaryColor,
                                contentPadding:
                                    const EdgeInsets.only(right: 1.0),
                                title: textStyle3(
                                    StringsManager.catStatusI,
                                    TextAlign.center,
                                    ColorManager.primaryColor),
                                value: 1,
                                groupValue: selectedCatStatus,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCatStatus =
                                        int.parse(value.toString());
                                  });
                                }),
                          ),
                          Expanded(flex: 1, child: Container()),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile(
                            activeColor: ColorManager.primaryColor,
                            title: textStyle3(StringsManager.catStatusA,
                                TextAlign.center, ColorManager.primaryColor),
                            value: 0,
                            groupValue: selectedCatStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedCatStatus = int.parse(value.toString());
                              });
                            }),
                        RadioListTile(
                            activeColor: ColorManager.primaryColor,
                            title: textStyle3(StringsManager.catStatusI,
                                TextAlign.center, ColorManager.primaryColor),
                            value: 1,
                            groupValue: selectedCatStatus,
                            onChanged: (value) {
                              setState(() {
                                selectedCatStatus = int.parse(value.toString());
                              });
                            }),
                      ],
                    ),
              buildSpaceVertical(2.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p34),
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: ColorManager.primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(AppSize.s16),
                  ),
                  child: Row(
                    children: [
                      buildSpaceHorizontal(5.w),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 5.h,
                          width: size.width > 550 ? 13.w : 18.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s20),
                            color: ColorManager.primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              StringsManager.chooseFile,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.openSans(
                                fontSize: FontSize.s14,
                                color: ColorManager.whiteColor,
                                fontWeight: FontWeightManager.semiBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildSpaceHorizontal(5.w),
                    ],
                  ),
                ),
              ),
              buildSpaceVertical(2.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 2),
                child: const Divider(
                    height: 1, thickness: 1, color: ColorManager.primaryColor),
              ),
              buildSpaceVertical(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          color: ColorManager.primaryColor,
                        ),
                        child: Center(
                          child: textStyle3("SAVE", TextAlign.center,
                              ColorManager.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          color: ColorManager.redColor,
                        ),
                        child: Center(
                          child: textStyle3("CANCEL", TextAlign.center,
                              ColorManager.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
              buildSpaceVertical(1.h),
            ],
          ),
        ),
      ),
    );
  }
}
