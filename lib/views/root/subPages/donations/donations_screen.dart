


import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/donation_controller.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/models/donation_model.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/constants/color_manager.dart';


class DonationsPage extends StatefulWidget {
  const DonationsPage({Key? key}) : super(key: key);

  @override
  State<DonationsPage> createState() => _DonationsPageState();
}

class _DonationsPageState extends State<DonationsPage> {

  final DonationController _donationController = Get.put(DonationController());
  List<DonationModel> donationModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    donationModel = (await _donationController.getDonationsData())!;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        return _donationController.isLoading.isTrue ? const Center(child: CircularProgressIndicator())
            :
        donationModel.isNotEmpty ?
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
                Center(child: textStyle6("Donations List", TextAlign.left, ColorManager.darkColor)),
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
                            ? Center(child: textStyle2("Project", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Project", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("City", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("City", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Amount", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Amount", TextAlign.center, ColorManager.blackColor))
                    ),
                    DataColumn(
                        label: width > 800
                            ? Center(child: textStyle2("Transaction ID", TextAlign.center, ColorManager.blackColor))
                            : Center(child: textStyle0_5("Transaction ID", TextAlign.center, ColorManager.blackColor))
                    ),

                  ],
                  rows: List<DataRow>.generate(donationModel.length,
                        (index) => DataRow(cells: [
                      DataCell(width > 800
                          ? textStyle2("${donationModel[index].name}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${donationModel[index].name}", TextAlign.left,
                          ColorManager.blackColor)),

                          DataCell(width > 800
                              ? textStyle2("${donationModel[index].project}", TextAlign.left,
                              ColorManager.blackColor)
                              : textStyle0_5("${donationModel[index].project}", TextAlign.left,
                              ColorManager.blackColor)),

                          DataCell(width > 800
                              ? textStyle2("${donationModel[index].city}", TextAlign.left,
                              ColorManager.blackColor)
                              : textStyle0_5("${donationModel[index].city}", TextAlign.left,
                              ColorManager.blackColor)),

                          DataCell(width > 800
                              ? textStyle2("${donationModel[index].amount}", TextAlign.left,
                              ColorManager.blackColor)
                              : textStyle0_5("${donationModel[index].amount}", TextAlign.left,
                              ColorManager.blackColor)),

                          DataCell(width > 800
                              ? textStyle2("${donationModel[index].transactionID}", TextAlign.left,
                              ColorManager.blackColor)
                              : textStyle0_5("${donationModel[index].transactionID}", TextAlign.left,
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
