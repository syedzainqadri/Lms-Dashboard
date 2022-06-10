import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmsadminpanle/controllers/events/add_event.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({Key? key}) : super(key: key);

  @override
  _AddEventDialogState createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  final _eventNameController = TextEditingController();
  final _eventUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
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
  XFile? image, photo;
  String? imageUrl;
  File? file;
  bool loading = false;
  final ImagePicker _picker = ImagePicker();
  late DateTime selectedDate;
  DateTime todayDate = DateTime.now();
  final _dateController = TextEditingController();

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
                      child: textStyle4("Add New Event", TextAlign.center, ColorManager.darkColor)),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _eventNameController,
                    hintName: StringsManager.event,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _eventUrlController,
                    hintName: StringsManager.eventUrl,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _descriptionController,
                    hintName: StringsManager.eventDesc,
                    inputLines: 4,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                    child: TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter value';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                          borderSide: BorderSide(color: ColorManager.primaryColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                          borderSide: BorderSide(color: ColorManager.blackColor),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                          borderSide: BorderSide(color: ColorManager.redColor),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                          borderSide: BorderSide(color: ColorManager.redColor),
                        ),
                        disabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                          borderSide: BorderSide(color: ColorManager.whiteColor),
                        ),
                        hintText: StringsManager.eDate,
                        hintStyle: const TextStyle(fontSize: AppSize.s10),
                        fillColor: ColorManager.whiteColor,
                        filled: true,
                        suffixIcon: InkWell(
                          onTap: () => _selectDate(context),
                          child: const Icon(
                            Icons.calendar_today,
                            color: ColorManager.primaryColor,
                          ),
                        ),
                        errorStyle: const TextStyle(color: ColorManager.redColor),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     buildSpaceHorizontal(5.w),
                  //     catImage != null ?
                  //     Container(
                  //       height: 24.h,
                  //       width: 28.w,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(AppSize.s10),
                  //         border: Border.all(color: ColorManager.primaryColor, width: 1),
                  //       ),
                  //       child: Image.file(file),
                  //     ) :
                  //     Container(
                  //       height: 24.h,
                  //       width: 28.w,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(AppSize.s10),
                  //         border: Border.all(color: ColorManager.primaryColor, width: 1),
                  //       ),
                  //       child: const Center(child: Icon(Icons.image, size: 100)),
                  //     ),
                  //     buildSpaceHorizontal(5.w),
                  //
                  //
                  //
                  //
                  //   ],
                  // ),

                  buildSpaceVertical(2.h),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.status, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: status ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          status = true;
                                        } else {
                                          status = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.tarana, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: tarana ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          tarana = true;
                                        } else {
                                          tarana = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.poster, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: poster ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          poster = true;
                                        } else {
                                          poster = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.sponsors, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: sponsors ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          sponsors = true;
                                        } else {
                                          sponsors = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.program, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: program ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          program = true;
                                        } else {
                                          program = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.resourcePersons,
                                        TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: resourcePersons ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          resourcePersons = true;
                                        } else {
                                          resourcePersons = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.gallery, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: gallery ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          gallery = true;
                                        } else {
                                          gallery = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.gallery, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: gallery ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          gallery = true;
                                        } else {
                                          gallery = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.media, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: media ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          media = true;
                                        } else {
                                          media = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.getInvolved, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: getInvolved ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          getInvolved = true;
                                        } else {
                                          getInvolved = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.testimonials,
                                        TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: testimonials ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          testimonials = true;
                                        } else {
                                          testimonials = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.venue, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: venue ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          venue = true;
                                        } else {
                                          venue = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.registration,
                                        TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: registration ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          registration = true;
                                        } else {
                                          registration = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.videos, TextAlign.center,
                                        ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: videos ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          videos = true;
                                        } else {
                                          videos = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              buildSpaceVertical(2.h),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.bookLaunches,
                                        TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: bookLaunches ? 0 : 1,
                                      activeBgColors: const [
                                        [Colors.cyan],
                                        [Colors.redAccent]
                                      ],
                                      activeFgColor: Colors.white,
                                      inactiveBgColor: Colors.grey,
                                      inactiveFgColor: Colors.white,
                                      totalSwitches: 2,
                                      labels: const ['YES', 'NO'],
                                      onToggle: (index) {
                                        if (index == 0) {
                                          bookLaunches = true;
                                        } else {
                                          bookLaunches = false;
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            imageUrl != null ?
                            Image.network(imageUrl!, height: 200, width: 250)
                            : Image.asset("assets/placeholder.png", height: 200, width: 250),
                            buildSpaceVertical(3.h),
                            InkWell(
                              onTap: () => getImage(),
                              child: Center(
                                child: Container(
                                  height: 5.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppSize.s10),
                                    color: ColorManager.darkColor,
                                  ),
                                  child: loading ?  const Center(child: CircularProgressIndicator()) : Center(
                                      child: textStyle2("Add Image", TextAlign.center,
                                          ColorManager.whiteColor)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  buildSpaceVertical(2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 2),
                    child: const Divider(
                        height: 1,
                        thickness: 1,
                        color: ColorManager.darkColor),
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
                            await AddEvent().addEvent(
                                _eventNameController.text,
                                imageUrl,
                                _eventUrlController.text,
                                _descriptionController.text,
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
                                status, _dateController.text);
                            Get.offAllNamed('/root');
                          },
                          child: Container(
                            height: 5.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.darkColor,
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
          )),
    );
  }

  getImage() async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    PickedFile? pickedFile;
    if (photo != null) {
      image = photo;
      file = File(image!.path);
      pickedFile = PickedFile(file!.path);
      await uploadImageToStorage(pickedFile);
    }
  }

  uploadImageToStorage(PickedFile? pickedFile) async {
    setState(() { loading = true; });
    DateTime dateTime = DateTime.now();
    Reference reference = FirebaseStorage.instance.ref().child("eventImage/$dateTime");
    await reference.putData(await pickedFile!.readAsBytes(), SettableMetadata(contentType: 'image/jpeg'));
    imageUrl = await reference.getDownloadURL();
    print(imageUrl);
    setState(() { loading = false; });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != todayDate) {
      setState(() {
        _dateController.text = picked.toString().substring(0, 10);
        selectedDate = picked;
      });
    }
  }

}
