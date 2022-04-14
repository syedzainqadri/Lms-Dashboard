import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/models/home_top_banner_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../../../controllers/homeTopBanner/get_home_topbanner_controller.dart';
import 'delete_home_top_banner_dialog.dart';
import 'edit_home_top_banner_dialog.dart';
import 'view_home_top_banner_dialog.dart';

class HomeTopBannerTable extends StatefulWidget {
  const HomeTopBannerTable({Key? key}) : super(key: key);

  @override
  State<HomeTopBannerTable> createState() => _HomeTopBannerTableState();
}
class _HomeTopBannerTableState extends State<HomeTopBannerTable> {

  final GetHomeTopBannerController _homeTopBannerController = Get.put(GetHomeTopBannerController());
  List<HomeTopBannerModel> bannerModel = [];


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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    buildSpaceVertical(2.h),
                    textStyle3("Home Top Banner", TextAlign.left, ColorManager.primaryColor),
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
                            color: ColorManager.primaryColor,
                            iconSize: 24,
                            onPressed: () {
                              showDialog(
                                barrierColor: Colors.black26,
                                context: context,
                                builder: (context) {
                                  return ViewHomeTopBannerDialog(id: bannerModel[index].id!);
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
                                  return EditHomeTopBannerDialog(id: bannerModel[index].id!);
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
                                  return DeleteHomeTopBannerDialog(id: bannerModel[index].id!);
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
