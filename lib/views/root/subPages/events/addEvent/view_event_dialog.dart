import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lmsadminpanle/controllers/events/get_events_controller.dart';
import 'package:lmsadminpanle/models/event_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ViewEventDialog extends StatefulWidget {
  final String id;
  const ViewEventDialog({Key? key, required this.id}) : super(key: key);

  @override
  _ViewEventDialogState createState() => _ViewEventDialogState();
}

class _ViewEventDialogState extends State<ViewEventDialog> {
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
  final GetEventController _eventController = Get.put(GetEventController());
  EventModel? eventModel;
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  Uint8List? bytes;
  String? image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    eventModel = await _eventController.getEventData(widget.id);
    setState(() {
      _eventNameController.text = eventModel!.name!;
      _urlController.text = eventModel!.eventUrl!;
      _descriptionController.text = eventModel!.description!;
      _dateController.text = eventModel!.eventDate!;
      status = eventModel!.status!;
      image = eventModel!.url != null ? eventModel!.url : null ;
      tarana = eventModel!.tarana!;
      poster = eventModel!.poster!;
      sponsors = eventModel!.sponsors!;
      program = eventModel!.program!;
      resourcePersons = eventModel!.resource_Persons!;
      gallery = eventModel!.gallery!;
      media = eventModel!.media!;
      getInvolved = eventModel!.getInvolved!;
      testimonials = eventModel!.testimonials!;
      venue = eventModel!.venue!;
      registration = eventModel!.registration!;
      videos = eventModel!.videos!;
      bookLaunches = eventModel!.book_launches!;
    });
    // final ByteData imageData = await NetworkAssetBundle(Uri.parse(_urlController.text)).load(_urlController.text);
    // bytes = imageData.buffer.asUint8List();
    // print(bytes);
    // setState(() {});
  }

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
        child: Obx(() {
          return _eventController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSpaceVertical(2.h),
                  Center(
                      child: textStyle4("View Event", TextAlign.center, ColorManager.darkColor)),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _eventNameController,
                    hintName: StringsManager.event,
                    isLarge: size.width > 800 ? true : false,
                  ),

                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _urlController,
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
                  CustomTextField(
                    controller: _dateController,
                    hintName: StringsManager.eDate,
                    isLarge: size.width > 800 ? true : false,
                  ),

                  buildSpaceVertical(2.h),
                  //

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
                                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    textStyle3(StringsManager.status, TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: status == true ? 0 : 1,
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
                                    textStyle3(StringsManager.tarana, TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: tarana == true ? 0 : 1,
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
                                    textStyle3(StringsManager.poster, TextAlign.center, ColorManager.darkColor),
                                    ToggleSwitch(
                                      customWidths: const [50.0, 50.0],
                                      cornerRadius: 20.0,
                                      initialLabelIndex: poster == true ? 0 : 1,
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
                                    textStyle3(StringsManager.sponsors, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.program, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.resourcePersons, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.gallery, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.media, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.getInvolved, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.testimonials, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.venue, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.registration, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.videos, TextAlign.center, ColorManager.darkColor),
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
                                    textStyle3(StringsManager.bookLaunches, TextAlign.center, ColorManager.darkColor),
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
                            ],
                          ),
                        ),
                        image != null ? Center(child: Image.network(image!, height: 200, width: 250)) :
                        Center(child: Image.asset("assets/placeholder.png", height: 200, width: 250)),
                      ],
                    ),
                  ),

                  //
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 2),
                    child: const Divider(
                        height: 1, thickness: 1, color: ColorManager.darkColor),
                  ),
                  buildSpaceVertical(2.h),
                  buildSpaceVertical(1.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}