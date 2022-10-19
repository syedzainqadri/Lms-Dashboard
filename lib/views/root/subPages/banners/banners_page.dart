import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../controllers/donation/add_donation_banner_controller.dart';
import '../../../../controllers/eventDetail/add_eventDetail_banner_controller.dart';
import '../../../../controllers/feedback/add_feedback_banner_controller.dart';
import '../../../../controllers/homeBottomBanner/add_home_bottom_banner_controller.dart';
import '../../../../controllers/homeTopBanner/add_home_topbanner.dart';
import '../../../../controllers/title_controller.dart';
import '../../../../controllers/volunteer/add_volunteer_banner_controller.dart';
import '../../../../utils/constants/strings_manager.dart';
import '../../../../utils/helpers/helper.dart';
import '../../../../widgets/text_field.dart';
import 'package:get/get.dart';

import '../events/widgets/add_button.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  final _homeTopUrlController = TextEditingController();
  final _homeBottomUrlController = TextEditingController();
  final _volunteerUrlController = TextEditingController();
  final _donationUrlController = TextEditingController();
  final _eventDetailUrlController = TextEditingController();
  final _feedbackUrlController = TextEditingController();
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  XFile? image, photo;
  String? imageUrl1;
  String? imageUrl2;
  String? imageUrl3;
  String? imageUrl4;
  String? imageUrl5;
  String? imageUrl6;
  File? file;
  bool loading1 = false;
  bool loading2 = false;
  bool loading3 = false;
  bool loading4 = false;
  bool loading5 = false;
  bool loading6 = false;
  final ImagePicker _picker = ImagePicker();
  final TitleController titleController = Get.put(TitleController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.changeName("Banners");
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12, vertical: AppPadding.p12),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              border: Border.all(
                  color: ColorManager.primaryColor.withOpacity(.4), width: .5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: ColorManager.grayColor.withOpacity(.1),
                    blurRadius: 12)
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSpaceVertical(5.h),
                  DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    border: TableBorder.all(
                        width: 1.0, color: ColorManager.darkColor),
                    columns: [
                      DataColumn(
                          label: width > 800
                              ? Center(
                                  child: textStyle2("Name", TextAlign.center,
                                      ColorManager.blackColor))
                              : Center(
                                  child: textStyle0_5("Name", TextAlign.center,
                                      ColorManager.blackColor))),
                      DataColumn2(
                          label: width > 800
                              ? Center(
                                  child: textStyle2(
                                      "Event Url",
                                      TextAlign.center,
                                      ColorManager.blackColor))
                              : Center(
                                  child: textStyle0_5(
                                      "Event Url",
                                      TextAlign.center,
                                      ColorManager.blackColor)),
                          size: ColumnSize.L),
                      DataColumn(
                          label: width > 800
                              ? Center(
                                  child: textStyle2("Status", TextAlign.center,
                                      ColorManager.blackColor))
                              : Center(
                                  child: textStyle0_5(
                                      "Status",
                                      TextAlign.center,
                                      ColorManager.blackColor))),
                      DataColumn(
                          label: width > 800
                              ? Center(
                                  child: textStyle2("Image", TextAlign.center,
                                      ColorManager.blackColor))
                              : Center(
                                  child: textStyle0_5("Image", TextAlign.center,
                                      ColorManager.blackColor))),
                      DataColumn(
                          label: width > 800
                              ? Center(
                                  child: textStyle2("Action", TextAlign.center,
                                      ColorManager.blackColor))
                              : Center(
                                  child: textStyle0_5(
                                      "Action",
                                      TextAlign.center,
                                      ColorManager.blackColor))),
                    ],
                    rows: List<DataRow>.generate(
                      6,
                      (index) => DataRow(cells: [
                        DataCell(index == 0
                            ? width > 800
                                ? textStyle2("Home Top Banner", TextAlign.left,
                                    ColorManager.blackColor)
                                : textStyle0_5("Home Top Banner",
                                    TextAlign.left, ColorManager.blackColor)
                            : index == 1
                                ? width > 800
                                    ? textStyle2("Home Bottom Banner",
                                        TextAlign.left, ColorManager.blackColor)
                                    : textStyle0_5("Home Bottom Banner",
                                        TextAlign.left, ColorManager.blackColor)
                                : index == 2
                                    ? width > 800
                                        ? textStyle2(
                                            "Volunteer Banner",
                                            TextAlign.left,
                                            ColorManager.blackColor)
                                        : textStyle0_5(
                                            "Volunteer Banner",
                                            TextAlign.left,
                                            ColorManager.blackColor)
                                    : index == 3
                                        ? width > 800
                                            ? textStyle2(
                                                "Donation Banner",
                                                TextAlign.left,
                                                ColorManager.blackColor)
                                            : textStyle0_5(
                                                "Donation Banner",
                                                TextAlign.left,
                                                ColorManager.blackColor)
                                        : index == 4
                                            ? width > 800
                                                ? textStyle2(
                                                    "Event Detail Banner",
                                                    TextAlign.left,
                                                    ColorManager.blackColor)
                                                : textStyle0_5(
                                                    "Event Detail Banner",
                                                    TextAlign.left,
                                                    ColorManager.blackColor)
                                            : index == 5
                                                ? width > 800
                                                    ? textStyle2(
                                                        "Feedback Banner",
                                                        TextAlign.left,
                                                        ColorManager.blackColor)
                                                    : textStyle0_5(
                                                        "Feedback Banner",
                                                        TextAlign.left,
                                                        ColorManager.blackColor)
                                                : const SizedBox.shrink()),
                        DataCell(index == 0
                            ? CustomTextField(
                                controller: _homeTopUrlController,
                                hintName: StringsManager.eventUrl,
                                isLarge: width > 800 ? true : false)
                            : index == 1
                                ? CustomTextField(
                                    controller: _homeBottomUrlController,
                                    hintName: StringsManager.eventUrl,
                                    isLarge: width > 800 ? true : false)
                                : index == 2
                                    ? CustomTextField(
                                        controller: _volunteerUrlController,
                                        hintName: StringsManager.eventUrl,
                                        isLarge: width > 800 ? true : false)
                                    : index == 3
                                        ? CustomTextField(
                                            controller: _donationUrlController,
                                            hintName: StringsManager.eventUrl,
                                            isLarge: width > 800 ? true : false)
                                        : index == 4
                                            ? CustomTextField(
                                                controller:
                                                    _eventDetailUrlController,
                                                hintName:
                                                    StringsManager.eventUrl,
                                                isLarge:
                                                    width > 800 ? true : false)
                                            : index == 5
                                                ? CustomTextField(
                                                    controller:
                                                        _feedbackUrlController,
                                                    hintName:
                                                        StringsManager.eventUrl,
                                                    isLarge: width > 800
                                                        ? true
                                                        : false)
                                                : const SizedBox.shrink()),
                        DataCell(index == 0
                            ? Center(
                                child: ToggleSwitch(
                                  customWidths: const [50.0, 50.0],
                                  cornerRadius: 20.0,
                                  initialLabelIndex: status1 ? 0 : 1,
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
                                      status1 = true;
                                    } else {
                                      status1 = false;
                                    }
                                  },
                                ),
                              )
                            : index == 1
                                ? Center(
                                    child: ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: status2 ? 0 : 1,
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
                                          status2 = true;
                                        } else {
                                          status2 = false;
                                        }
                                      },
                                    ),
                                  )
                                : index == 2
                                    ? Center(
                                        child: ToggleSwitch(
                                          customWidths: const [50.0, 50.0],
                                          cornerRadius: 20.0,
                                          initialLabelIndex: status3 ? 0 : 1,
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
                                              status3 = true;
                                            } else {
                                              status3 = false;
                                            }
                                          },
                                        ),
                                      )
                                    : index == 3
                                        ? Center(
                                            child: ToggleSwitch(
                                              customWidths: const [50.0, 50.0],
                                              cornerRadius: 20.0,
                                              initialLabelIndex:
                                                  status4 ? 0 : 1,
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
                                                  status4 = true;
                                                } else {
                                                  status4 = false;
                                                }
                                              },
                                            ),
                                          )
                                        : index == 4
                                            ? Center(
                                                child: ToggleSwitch(
                                                  customWidths: const [
                                                    50.0,
                                                    50.0
                                                  ],
                                                  cornerRadius: 20.0,
                                                  initialLabelIndex:
                                                      status5 ? 0 : 1,
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
                                                      status5 = true;
                                                    } else {
                                                      status5 = false;
                                                    }
                                                  },
                                                ),
                                              )
                                            : index == 5
                                                ? Center(
                                                    child: ToggleSwitch(
                                                      customWidths: const [
                                                        50.0,
                                                        50.0
                                                      ],
                                                      cornerRadius: 20.0,
                                                      initialLabelIndex:
                                                          status6 ? 0 : 1,
                                                      activeBgColors: const [
                                                        [Colors.cyan],
                                                        [Colors.redAccent]
                                                      ],
                                                      activeFgColor:
                                                          Colors.white,
                                                      inactiveBgColor:
                                                          Colors.grey,
                                                      inactiveFgColor:
                                                          Colors.white,
                                                      totalSwitches: 2,
                                                      labels: const [
                                                        'YES',
                                                        'NO'
                                                      ],
                                                      onToggle: (index) {
                                                        if (index == 0) {
                                                          status6 = true;
                                                        } else {
                                                          status6 = false;
                                                        }
                                                      },
                                                    ),
                                                  )
                                                : const SizedBox.shrink()),
                        DataCell(index == 0
                            ? InkWell(
                                onTap: () => getImage(0),
                                child: Center(
                                  child: SizedBox(
                                      height: 200,
                                      width: 250,
                                      child: loading1
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : imageUrl1 != null
                                              ? Image.network(imageUrl1!,
                                                  height: 200, width: 250)
                                              : const Center(
                                                  child: Icon(Icons
                                                      .add_photo_alternate_outlined),
                                                )),
                                ),
                              )
                            : index == 1
                                ? InkWell(
                                    onTap: () => getImage(1),
                                    child: Center(
                                      child: SizedBox(
                                          height: 200,
                                          width: 250,
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(width: 1, color: ColorManager.darkColor),
                                          // ),
                                          child: loading2
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : imageUrl2 != null
                                                  ? Image.network(imageUrl2!,
                                                      height: 200, width: 250)
                                                  : const Center(
                                                      child: Icon(Icons
                                                          .add_photo_alternate_outlined),
                                                    )),
                                    ),
                                  )
                                : index == 2
                                    ? InkWell(
                                        onTap: () => getImage(2),
                                        child: Center(
                                          child: SizedBox(
                                              height: 200,
                                              width: 250,
                                              child: loading3
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                  : imageUrl3 != null
                                                      ? Image.network(
                                                          imageUrl3!,
                                                          height: 200,
                                                          width: 250)
                                                      : const Center(
                                                          child: Icon(Icons
                                                              .add_photo_alternate_outlined),
                                                        )),
                                        ),
                                      )
                                    : index == 3
                                        ? InkWell(
                                            onTap: () => getImage(3),
                                            child: Center(
                                              child: SizedBox(
                                                  height: 200,
                                                  width: 250,
                                                  child: loading4
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : imageUrl4 != null
                                                          ? Image.network(
                                                              imageUrl4!,
                                                              height: 200,
                                                              width: 250)
                                                          : const Center(
                                                              child: Icon(Icons
                                                                  .add_photo_alternate_outlined),
                                                            )),
                                            ),
                                          )
                                        : index == 4
                                            ? InkWell(
                                                onTap: () => getImage(4),
                                                child: Center(
                                                  child: SizedBox(
                                                      height: 200,
                                                      width: 250,
                                                      child: loading5
                                                          ? const Center(
                                                              child:
                                                                  CircularProgressIndicator())
                                                          : imageUrl5 != null
                                                              ? Image.network(
                                                                  imageUrl5!,
                                                                  height: 200,
                                                                  width: 250)
                                                              : const Center(
                                                                  child: Icon(Icons
                                                                      .add_photo_alternate_outlined),
                                                                )),
                                                ),
                                              )
                                            : index == 5
                                                ? InkWell(
                                                    onTap: () => getImage(5),
                                                    child: Center(
                                                      child: SizedBox(
                                                          height: 200,
                                                          width: 250,
                                                          child: loading6
                                                              ? const Center(
                                                                  child:
                                                                      CircularProgressIndicator())
                                                              : imageUrl6 !=
                                                                      null
                                                                  ? Image.network(
                                                                      imageUrl6!,
                                                                      height:
                                                                          200,
                                                                      width:
                                                                          250)
                                                                  : const Center(
                                                                      child: Icon(
                                                                          Icons
                                                                              .add_photo_alternate_outlined),
                                                                    )),
                                                    ),
                                                  )
                                                : const SizedBox.shrink()),
                        DataCell(
                          Center(
                              child: InkWell(
                                  onTap: () async {
                                    if (index == 0) {
                                      if (imageUrl1 != null &&
                                          _homeTopUrlController
                                              .text.isNotEmpty) {
                                        await AddHomeTopBanner()
                                            .addHomeTopBanner(
                                                imageUrl1,
                                                _homeTopUrlController.text,
                                                status1);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                    if (index == 1) {
                                      if (imageUrl2 != null &&
                                          _homeBottomUrlController
                                              .text.isNotEmpty) {
                                        await AddHomeBottomBanner()
                                            .addHomeBottomBanner(
                                                imageUrl2,
                                                _homeBottomUrlController.text,
                                                status2);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                    if (index == 2) {
                                      if (imageUrl3 != null &&
                                          _volunteerUrlController
                                              .text.isNotEmpty) {
                                        await AddVolunteerBanner()
                                            .addVolunteerBanner(
                                                imageUrl3,
                                                _volunteerUrlController.text,
                                                status3);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                    if (index == 3) {
                                      if (imageUrl4 != null &&
                                          _donationUrlController
                                              .text.isNotEmpty) {
                                        await AddDonationBanner()
                                            .addDonationBanner(
                                                imageUrl4,
                                                _donationUrlController.text,
                                                status4);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                    if (index == 4) {
                                      if (imageUrl5 != null &&
                                          _eventDetailUrlController
                                              .text.isNotEmpty) {
                                        await AddEventDetailBanner()
                                            .addEventDetailsBanner(
                                                imageUrl5,
                                                _eventDetailUrlController.text,
                                                status5);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                    if (index == 5) {
                                      if (imageUrl6 != null &&
                                          _feedbackUrlController
                                              .text.isNotEmpty) {
                                        await AddFeedbackBanner()
                                            .addFeedBackBanner(
                                                imageUrl6,
                                                _feedbackUrlController.text,
                                                status6);
                                        Get.offAllNamed('/root');
                                      } else {
                                        Get.snackbar(
                                            'Error', 'Please fill all fields');
                                      }
                                    }
                                  },
                                  child: addButton(
                                      "Add Banner", width > 800 ? false : true))
                              // IconButton(
                              //   icon: const Icon(Icons.save),
                              //   color: ColorManager.darkColor,
                              //   iconSize: 24,
                              //   onPressed: () async{
                              //   },
                              // ),
                              ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          )
          // Column(
          //   children: [
          //     // home top banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Home Top Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddHomeTopBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add Home Top Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const HomeTopBannerTable(),
          //
          //     // home bottom banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Home Bottom Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddHomeBottomBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add Home Bottom Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const HomeBottomBannerTable(),
          //
          //     // donation banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Donation Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddDonationBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add Donation Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const DonationBannerTable(),
          //
          //     // feedback banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Feedback Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddFeedbackBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add Feedback Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const FeedbackBannerTable(),
          //
          //     // volunteer banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Volunteer Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddVolunteerBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add Volunteer Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const VolunteerBannerTable(),
          //
          //     // event detail banner
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         textStyle4("Event Detail Banner", TextAlign.left, ColorManager.primaryColor),
          //         InkWell(
          //             onTap: () {
          //               showDialog(
          //                 barrierColor: Colors.black26,
          //                 context: context,
          //                 builder: (context) {
          //                   return const AddEventDetailBannerDialog();
          //                 },
          //               );
          //             },
          //             child: addButton("Add EventDetail Banner", width > 800 ? false : true)),
          //       ],
          //     ),
          //     const EventDetailBannerTable(),
          //   ],
          // ),
          ),
    );
  }

  getImage(int index) async {
    if (index == 0) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }

    if (index == 1) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }

    if (index == 2) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }

    if (index == 3) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }

    if (index == 4) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }

    if (index == 5) {
      photo = await _picker.pickImage(source: ImageSource.gallery);
      PickedFile? pickedFile;
      if (photo != null) {
        image = photo;
        file = File(image!.path);
        pickedFile = PickedFile(file!.path);
        await uploadImageToStorage(pickedFile, index);
      }
    }
  }

  uploadImageToStorage(PickedFile? pickedFile, int index) async {
    if (index == 0) {
      setState(() {
        loading1 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("HomeTopBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl1 = await reference.getDownloadURL();
      setState(() {
        loading1 = false;
      });
    }
    if (index == 1) {
      setState(() {
        loading2 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("HomeBottomBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl2 = await reference.getDownloadURL();
      setState(() {
        loading2 = false;
      });
    }
    if (index == 2) {
      setState(() {
        loading3 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("VolunteerBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl3 = await reference.getDownloadURL();
      setState(() {
        loading3 = false;
      });
    }
    if (index == 3) {
      setState(() {
        loading4 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("DonationBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl4 = await reference.getDownloadURL();
      setState(() {
        loading4 = false;
      });
    }
    if (index == 4) {
      setState(() {
        loading5 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("EventDetailBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl5 = await reference.getDownloadURL();
      setState(() {
        loading5 = false;
      });
    }
    if (index == 5) {
      setState(() {
        loading6 = true;
      });
      DateTime dateTime = DateTime.now();
      Reference reference =
          FirebaseStorage.instance.ref().child("FeedbackBanner/$dateTime");
      await reference.putData(await pickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      imageUrl6 = await reference.getDownloadURL();
      setState(() {
        loading6 = false;
      });
    }
  }
}
