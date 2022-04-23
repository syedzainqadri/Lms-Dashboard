import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/models/donation_banner_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/donation/delete_donation_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/donation/edit_donation_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/donation/view_donation_banner_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../../../controllers/donation/get_donation_banner_controller.dart';

class DonationBannerTable extends StatefulWidget {
  const DonationBannerTable({Key? key}) : super(key: key);

  @override
  State<DonationBannerTable> createState() => _DonationBannerTableState();
}
class _DonationBannerTableState extends State<DonationBannerTable> {

  final GetDonationBannerController _homeTopBannerController = Get.put(GetDonationBannerController());
  List<DonationBannerModel> bannerModel = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    bannerModel = (await _homeTopBannerController.getHomeTopBannersData())!;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Obx(() {
          return _homeTopBannerController.isLoadingBanners.isTrue ? const Center(child: CircularProgressIndicator()) :
          Container(
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              border: Border.all(
                  color: ColorManager.darkColor.withOpacity(.4), width: .5),
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
                    textStyle3("Donation Banner", TextAlign.left, ColorManager.darkColor),
                  ],
                ),
                DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  columns: [
                    DataColumn(
                        label: width > 800
                            ? textStyle2(
                            "Status", TextAlign.center, ColorManager.blackColor)
                            : textStyle0_5("Status", TextAlign.center,
                            ColorManager.blackColor)),
                    DataColumn(
                      label: width > 800
                          ? textStyle2(
                          "EVENT URL", TextAlign.center, ColorManager.blackColor)
                          : textStyle0_5(
                          "EVENT URL", TextAlign.center, ColorManager.blackColor),
                    ),
                    DataColumn(
                      label: width > 800
                          ? textStyle2(
                          "Actions", TextAlign.center, ColorManager.blackColor)
                          : textStyle0_5(
                          "Actions", TextAlign.center, ColorManager.blackColor),
                    ),
                  ],
                  rows: List<DataRow>.generate(bannerModel.length,
                        (index) => DataRow(cells: [
                      DataCell(width > 800
                          ? textStyle2(bannerModel[index].status! ? "ACTIVE" : "INACTIVE", TextAlign.center, ColorManager.blackColor)
                          : textStyle0_5(bannerModel[index].status! ? "ACTIVE" : "INACTIVE", TextAlign.center, ColorManager.blackColor)),
                      DataCell(width > 800
                          ? textStyle2("${bannerModel[index].eventUrl}", TextAlign.center, ColorManager.blackColor)
                          : textStyle0_5("${bannerModel[index].eventUrl}", TextAlign.center, ColorManager.blackColor)),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
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
                                  return ViewDonationBannerDialog(id: bannerModel[index].id!);
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: ColorManager.bluishColor,
                            iconSize: 24,
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return EditDonationBannerDialog(id: bannerModel[index].id!);
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: ColorManager.redColor,
                            iconSize: 24,
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return DeleteDonationBannerDialog(id: bannerModel[index].id!);
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
        })
    );
  }
}
