import 'package:flutter/material.dart';
import 'package:lmsadminpanle/services/database.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddCategoryDialog extends StatefulWidget {
  const AddCategoryDialog({Key? key}) : super(key: key);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  final _eventNameController = TextEditingController();
  final _urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var selectedCatStatus = 0;
  bool status = false;
  bool tarana = false;
  bool poster = false;
  bool sponsors = false;
  bool program = false;
  bool resourcePersons = false;
  bool gallery = false;
  bool media = false;
  bool getInvolved = false;
  bool testimonials = false;
  bool venue = false;
  bool registration = false;
  bool videos = false;
  bool bookLaunches = false;

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
        height: size.height * 0.80,
        width: size.width * 0.7,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSpaceVertical(2.h),
                Center(
                    child: textStyle4("Add New Event", TextAlign.center,
                        ColorManager.primaryColor)),
                buildSpaceVertical(2.h),
                CustomTextField(
                  controller: _eventNameController,
                  hintName: StringsManager.event,
                  icon: Icons.category,
                  isLarge: size.width > 800 ? true : false,
                ),
                buildSpaceVertical(2.h),
                CustomTextField(
                  controller: _urlController,
                  hintName: StringsManager.eventUrl,
                  icon: Icons.description,
                  isLarge: size.width > 800 ? true : false,
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.status, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: status ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            status = true;
                          }else{
                            status = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.tarana, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: tarana ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            tarana = true;
                          }else{
                            tarana = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.poster, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: poster ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            poster = true;
                          }else{
                            poster = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.sponsors, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: sponsors ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            sponsors = true;
                          }else{
                            sponsors = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.program, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: program ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            program = true;
                          }else{
                            program = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.resourcePersons, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: resourcePersons ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            resourcePersons = true;
                          }else{
                            resourcePersons = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.gallery, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: gallery ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            gallery = true;
                          }else{
                            gallery = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.gallery, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: gallery ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            gallery = true;
                          }else{
                            gallery = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.media, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: media ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            media = true;
                          }else{
                            media = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.getInvolved, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: getInvolved ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            getInvolved = true;
                          }else{
                            getInvolved = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.testimonials, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: testimonials ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            testimonials = true;
                          }else{
                            testimonials = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.venue, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: venue ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            venue = true;
                          }else{
                            venue = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.registration, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: registration ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            registration = true;
                          }else{
                            registration = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.videos, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: videos ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            videos = true;
                          }else{
                            videos = false;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                buildSpaceVertical(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textStyle3(StringsManager.bookLaunches, TextAlign.center, ColorManager.primaryColor),
                      ToggleSwitch(
                        customWidths: const [50.0, 50.0],
                        cornerRadius: 20.0,
                        initialLabelIndex: bookLaunches ? 0 : 1,
                        activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        labels: const ['YES', 'NO'],
                        onToggle: (index) {
                          if(index == 0){
                            bookLaunches = true;
                          }else{
                            bookLaunches = false;
                          }
                        },
                      ),
                    ],
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
                        onTap: () async {
                          await Database().addEvent(
                              _eventNameController.text,
                              _urlController.text,
                              tarana,
                              poster,
                              sponsors,
                              program,
                              resourcePersons,
                              gallery,
                              media,
                              getInvolved,
                              testimonials,
                              venue,
                              registration,
                              videos,
                              bookLaunches,
                              status);
                          Get.offAllNamed('/root');
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
        )
      ),
    );
  }
}
