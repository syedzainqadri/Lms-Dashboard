


import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/controllers/volunteer_controller.dart';
import 'package:lmsadminpanle/models/volunteer_model.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/constants/color_manager.dart';


class VolunteersPage extends StatefulWidget {
  const VolunteersPage({Key? key}) : super(key: key);

  @override
  State<VolunteersPage> createState() => _VolunteersPageState();
}

class _VolunteersPageState extends State<VolunteersPage> {

  final VolunteerController _volunteerController = Get.put(VolunteerController());
  List<VolunteerModel> volunteerModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    volunteerModel = (await _volunteerController.getVolunteerData())!;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        return _volunteerController.isLoading.isTrue ? const Center(child: CircularProgressIndicator())
            :
        volunteerModel.isNotEmpty ?
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
                Center(child: textStyle6("Volunteers List", TextAlign.left, ColorManager.darkColor)),
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
                      label: width > 800 ? Center(child: textStyle2("Name", TextAlign.center, ColorManager.blackColor))
                          : Center(child: textStyle0_5("Name", TextAlign.center, ColorManager.blackColor)),
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Email", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Email", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("City", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("City", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Phone No", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Phone No", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Project", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Project", TextAlign.center, ColorManager.blackColor))
                    ),

                  ],
                  rows: List<DataRow>.generate(volunteerModel.length,
                        (index) => DataRow(cells: [
                      DataCell(width > 800
                          ? textStyle2("${volunteerModel[index].name}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${volunteerModel[index].name}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${volunteerModel[index].email}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${volunteerModel[index].email}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${volunteerModel[index].city}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${volunteerModel[index].city}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${volunteerModel[index].phoneNo}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${volunteerModel[index].phoneNo}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${volunteerModel[index].project}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${volunteerModel[index].project}", TextAlign.left,
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
