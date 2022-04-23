


import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/controllers/feedback_controller.dart';
import 'package:lmsadminpanle/models/feedback_model.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/constants/color_manager.dart';


class FeedbacksPage extends StatefulWidget {
  const FeedbacksPage({Key? key}) : super(key: key);

  @override
  State<FeedbacksPage> createState() => _FeedbacksPageState();
}

class _FeedbacksPageState extends State<FeedbacksPage> {

  final FeedbackController _feedbackController = Get.put(FeedbackController());
  List<FeedbackModel> feedbackModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    feedbackModel = (await _feedbackController.getFeedbackData())!;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        return _feedbackController.isLoading.isTrue ? const Center(child: CircularProgressIndicator())
            :
        feedbackModel.isNotEmpty ?
        Container(
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
                buildSpaceVertical(3.h),
                Center(child: textStyle6("Feedbacks List", TextAlign.left, ColorManager.darkColor)),
                buildSpaceVertical(5.h),
                DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  border: TableBorder.all(
                      width: 1.0,
                      color: ColorManager.darkColor),
                  columns: [
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Project", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Project", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Rating", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Rating", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Remarks", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Remarks", TextAlign.center, ColorManager.blackColor))
                    ),

                  ],
                  rows: List<DataRow>.generate(feedbackModel.length,
                        (index) => DataRow(cells: [
                      DataCell(width > 800
                          ? textStyle2("${feedbackModel[index].project}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${feedbackModel[index].project}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? Center(
                            child: textStyle2("${feedbackModel[index].rating}", TextAlign.left,
                            ColorManager.blackColor),
                          )
                          : Center(
                            child: textStyle0_5("${feedbackModel[index].rating}", TextAlign.left,
                            ColorManager.blackColor),
                          )),

                      DataCell(width > 800
                          ? textStyle2("${feedbackModel[index].remarks}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${feedbackModel[index].remarks}", TextAlign.left,
                          ColorManager.blackColor)),



                    ]),
                  ),
                ),
              ],
            ),
          ),
        )
            : Center(
          child: textStyle2("No Data Available", TextAlign.center, ColorManager.primaryColor),
        );
      }),
    );
  }
}

