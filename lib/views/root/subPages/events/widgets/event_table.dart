import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/events/get_events_controller.dart';
import 'package:lmsadminpanle/models/event_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../addEvent/delete_event_dialog.dart';
import '../addEvent/edit_event_dialog.dart';
import '../addEvent/view_event_dialog.dart';

class EventsTable extends StatefulWidget {
  const EventsTable({Key? key}) : super(key: key);

  @override
  State<EventsTable> createState() => _EventsTableState();
}

class _EventsTableState extends State<EventsTable> {
  final GetEventController _eventController = Get.put(GetEventController());
  List<EventModel> eventModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    eventModel = (await _eventController.getEventsData())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Obx(() {
          return _eventController.isLoadingEvents.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    border: Border.all(
                        color: ColorManager.primaryColor.withOpacity(.4),
                        width: .5),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          buildSpaceVertical(2.h),
                          textStyle3("Program List", TextAlign.left,
                              ColorManager.darkColor),
                        ],
                      ),
                      DataTable2(
                        columnSpacing: 12,
                        horizontalMargin: 12,
                        minWidth: 600,
                        border: TableBorder.all(
                            width: 1.0, color: ColorManager.darkColor),
                        columns: [
                          DataColumn2(
                            label: width > 800
                                ? Center(
                                    child: textStyle2(
                                        "Event Name",
                                        TextAlign.center,
                                        ColorManager.blackColor))
                                : Center(
                                    child: textStyle0_5(
                                        "Event Name",
                                        TextAlign.center,
                                        ColorManager.blackColor)),
                            // size: ColumnSize.L,
                          ),
                          DataColumn(
                              label: width > 800
                                  ? Center(
                                      child: textStyle2(
                                          "Status",
                                          TextAlign.center,
                                          ColorManager.blackColor))
                                  : Center(
                                      child: textStyle0_5(
                                          "Status",
                                          TextAlign.center,
                                          ColorManager.blackColor))),
                          // DataColumn(
                          //   label: width > 800
                          //       ? textStyle2(
                          //       "URL", TextAlign.center, ColorManager.blackColor)
                          //       : textStyle0_5(
                          //       "URL", TextAlign.center, ColorManager.blackColor),
                          // ),
                          DataColumn(
                            label: width > 800
                                ? Center(
                                    child: textStyle2(
                                        "Actions",
                                        TextAlign.right,
                                        ColorManager.blackColor))
                                : Center(
                                    child: textStyle0_5(
                                        "Actions",
                                        TextAlign.right,
                                        ColorManager.blackColor)),
                          ),
                        ],
                        rows: List<DataRow>.generate(
                          eventModel.length,
                          (index) => DataRow(cells: [
                            DataCell(width > 800
                                ? textStyle2("${eventModel[index].name}",
                                    TextAlign.left, ColorManager.blackColor)
                                : textStyle0_5("${eventModel[index].name}",
                                    TextAlign.left, ColorManager.blackColor)),
                            DataCell(width > 800
                                ? Center(
                                    child: textStyle2(
                                        eventModel[index].status!
                                            ? "ACTIVE"
                                            : "INACTIVE",
                                        TextAlign.center,
                                        ColorManager.blackColor))
                                : Center(
                                    child: textStyle0_5(
                                        eventModel[index].status!
                                            ? "ACTIVE"
                                            : "INACTIVE",
                                        TextAlign.center,
                                        ColorManager.blackColor))),
                            // DataCell(width > 800
                            //     ? textStyle2("${eventModel[index].eventUrl}", TextAlign.center, ColorManager.blackColor)
                            //     : textStyle0_5("${eventModel[index].eventUrl}", TextAlign.center, ColorManager.blackColor)),
                            DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.visibility),
                                  color: ColorManager.darkColor,
                                  iconSize: 24,
                                  onPressed: () {
                                    showDialog(
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (context) {
                                        return ViewEventDialog(
                                            id: eventModel[index].id!);
                                      },
                                    );
                                  },
                                ),
                                buildSpaceHorizontal(2.w),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: ColorManager.bluishColor,
                                  iconSize: 24,
                                  onPressed: () {
                                    showDialog(
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (context) {
                                        return EditEventDialog(
                                            id: eventModel[index].id!);
                                      },
                                    );
                                  },
                                ),
                                buildSpaceHorizontal(2.w),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: ColorManager.redColor,
                                  iconSize: 24,
                                  onPressed: () {
                                    showDialog(
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (context) {
                                        return DeleteEventDialog(
                                            id: eventModel[index].id!);
                                      },
                                    );
                                  },
                                ),
                              ],
                            )),
                          ]),
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }
}
