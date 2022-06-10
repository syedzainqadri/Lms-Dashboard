
import 'dart:typed_data';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/program/get_programs_controller.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../../models/program_model.dart';

class ViewProgramDialog extends StatefulWidget {
  final String id;
  const ViewProgramDialog({Key? key, required this.id}) : super(key: key);

  @override
  _ViewProgramDialogState createState() => _ViewProgramDialogState();
}

class _ViewProgramDialogState extends State<ViewProgramDialog> {
  final _programNameController = TextEditingController();
  final _programUrlController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var selectedCatStatus = 0;
  bool status = false;
  bool isFeatured = false;
  final GetProgramController _programController = Get.put(GetProgramController());
  ProgramModel? programModel;
  Uint8List? bytes;
  List programButtonModel = [];
  String? image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    programModel = await _programController.getProgramData(widget.id);
    setState(() {
      _programNameController.text = programModel!.name!;
      _programUrlController.text = programModel!.programUrl!;
      _descriptionController.text = programModel!.description!;
      _dateController.text = programModel!.programDate!;
      status = programModel!.status!;
      isFeatured = programModel!.isFeatured!;
      image = programModel!.url!;
      programButtonModel = programModel!.buttonList!;
    });
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
          return _programController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSpaceVertical(2.h),
                  Center(child: textStyle4("View Program", TextAlign.center, ColorManager.darkColor)),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _programNameController,
                    hintName: StringsManager.event,
                    isLarge: size.width > 800 ? true : false,
                  ),

                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _programUrlController,
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
                    hintName: StringsManager.date,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
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
                        textStyle3(StringsManager.isFeatured, TextAlign.center,
                            ColorManager.darkColor),
                        ToggleSwitch(
                          customWidths: const [50.0, 50.0],
                          cornerRadius: 20.0,
                          initialLabelIndex: isFeatured ? 0 : 1,
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
                              isFeatured = true;
                            } else {
                              isFeatured = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  buildSpaceVertical(2.h),
                  image!.isNotEmpty ? Center(child: Image.network(image!, height: 200, width: 250)) :
                  Center(child: Image.asset("assets/placeholder.png", height: 200, width: 250)),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.status, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: status ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         status = true;
                  //                       }else{
                  //                         status = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.tarana, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: tarana ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         tarana = true;
                  //                       }else{
                  //                         tarana = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.poster, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: poster ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         poster = true;
                  //                       }else{
                  //                         poster = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.sponsors, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: sponsors ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         sponsors = true;
                  //                       }else{
                  //                         sponsors = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.program, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: program ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         program = true;
                  //                       }else{
                  //                         program = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.resourcePersons, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: resourcePersons ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         resourcePersons = true;
                  //                       }else{
                  //                         resourcePersons = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.gallery, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: gallery ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         gallery = true;
                  //                       }else{
                  //                         gallery = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.media, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: media ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         media = true;
                  //                       }else{
                  //                         media = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.getInvolved, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: getInvolved ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         getInvolved = true;
                  //                       }else{
                  //                         getInvolved = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.testimonials, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: testimonials ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         testimonials = true;
                  //                       }else{
                  //                         testimonials = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.venue, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: venue ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         venue = true;
                  //                       }else{
                  //                         venue = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.registration, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: registration ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         registration = true;
                  //                       }else{
                  //                         registration = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.videos, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: videos ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         videos = true;
                  //                       }else{
                  //                         videos = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             buildSpaceVertical(2.h),
                  //             Padding(
                  //               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   textStyle3(StringsManager.bookLaunches, TextAlign.center, ColorManager.darkColor),
                  //                   ToggleSwitch(
                  //                     customWidths: const [50.0, 50.0],
                  //                     cornerRadius: 20.0,
                  //                     initialLabelIndex: bookLaunches ? 0 : 1,
                  //                     activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                  //                     activeFgColor: Colors.white,
                  //                     inactiveBgColor: Colors.grey,
                  //                     inactiveFgColor: Colors.white,
                  //                     totalSwitches: 2,
                  //                     labels: const ['YES', 'NO'],
                  //                     onToggle: (index) {
                  //                       if(index == 0){
                  //                         bookLaunches = true;
                  //                       }else{
                  //                         bookLaunches = false;
                  //                       }
                  //                     },
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),

                  //
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
                    child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 600,
                      border: TableBorder.all(
                          width: 1.0, color: ColorManager.darkColor),
                      columns: [
                        DataColumn2(
                          label:  Center(
                              child: textStyle2(
                                  "Button Name",
                                  TextAlign.center,
                                  ColorManager.blackColor)),
                        ),
                        DataColumn(
                            label:  Center(
                                child: textStyle2(
                                    "Button Url",
                                    TextAlign.center,
                                    ColorManager.blackColor))),
                        DataColumn(
                          label:Center(
                              child: textStyle2(
                                  "Action",
                                  TextAlign.right,
                                  ColorManager.blackColor)),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        programButtonModel.length,
                            (index) => DataRow(cells: [
                          DataCell(textStyle0_5("${programButtonModel[index]['buttonName']}", TextAlign.left, ColorManager.blackColor)),
                          DataCell( textStyle0_5(programButtonModel[index]['buttonUrl']!, TextAlign.center, ColorManager.blackColor)),
                          const DataCell(SizedBox.shrink()),
                        ]),
                      ),
                    ),
                  ),
                  buildSpaceVertical(5.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}