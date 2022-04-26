


import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmsadminpanle/controllers/feedback_controller.dart';
import 'package:lmsadminpanle/models/feedback_model.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import '../../../../controllers/title_controller.dart';
import '../../../../utils/constants/color_manager.dart';
import '../../../../utils/constants/strings_manager.dart';


class FeedbacksPage extends StatefulWidget {
  const FeedbacksPage({Key? key}) : super(key: key);

  @override
  State<FeedbacksPage> createState() => _FeedbacksPageState();
}

class _FeedbacksPageState extends State<FeedbacksPage> {

  final FeedbackController _feedbackController = Get.put(FeedbackController());
  List<FeedbackModel> feedbackModel = [];
  List<FeedbackModel> searchedModel = [];
  int _currentSortColumn = 0;
  bool _isAscending = true;
  final TitleController titleController = Get.put(TitleController());
  final _searchController = TextEditingController();
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      titleController.changeName("Feedbacks List");
    });
    getData();
  }


  getData() async{
    feedbackModel = (await _feedbackController.getFeedbackData())!;
    setState(() {
      searchedModel = feedbackModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() {
        return _feedbackController.isLoading.isTrue ? const Center(child: CircularProgressIndicator())
            :
        searchedModel.isNotEmpty ?
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
                ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                          borderSide: BorderSide(color: ColorManager.grayColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                          borderSide: BorderSide(color: ColorManager.grayColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                          borderSide: BorderSide(color: ColorManager.redColor),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                          borderSide: BorderSide(color: ColorManager.redColor),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                          borderSide: BorderSide(color: ColorManager.grayColor),
                        ),
                        hintText: StringsManager.searchF,
                        // hintStyle: TextStyle(fontSize: 10),
                        hintStyle: TextStyle(fontSize: AppSize.s10),

                        fillColor: ColorManager.whiteColor,
                        filled: true,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchResult = value;
                          searchedModel = searchedModel.where((donations) => donations.project!.toLowerCase().contains(_searchResult.toLowerCase())
                          ).toList();
                        });
                      }),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchResult = '';
                        searchedModel = feedbackModel;
                      });
                    },
                  ),
                ),
                buildSpaceVertical(5.h),
                DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  columns: [
                    DataColumn(
                        label: width > 800
                            ? textStyle2("Project", TextAlign.center, ColorManager.blackColor)
                            : textStyle0_5("Project", TextAlign.center, ColorManager.blackColor),
                        onSort: (columnIndex, _) {
                          setState(() {
                            _currentSortColumn = columnIndex;
                            if (_isAscending == true) {
                              _isAscending = false;
                              searchedModel.sort((productA, productB) => productB.project!.toLowerCase().compareTo(productA.project!.toLowerCase()));
                            } else {
                              _isAscending = true;
                              searchedModel.sort((productA, productB) => productA.project!.toLowerCase().compareTo(productB.project!.toLowerCase()));
                            }
                          });
                        }
                    ),
                    DataColumn(
                        label: width > 800
                            ? textStyle2("Rating", TextAlign.center, ColorManager.blackColor)
                            : textStyle0_5("Rating", TextAlign.center, ColorManager.blackColor)
                    ),
                    DataColumn(
                        label: width > 800
                            ? textStyle2("Remarks", TextAlign.center, ColorManager.blackColor)
                            : textStyle0_5("Remarks", TextAlign.center, ColorManager.blackColor)
                    ),

                  ],
                  rows: List<DataRow>.generate(searchedModel.length,
                        (index) => DataRow(cells: [
                      DataCell(width > 800
                          ? textStyle2("${searchedModel[index].project}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${searchedModel[index].project}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${searchedModel[index].rating}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${searchedModel[index].rating}", TextAlign.left,
                          ColorManager.blackColor)),

                      DataCell(width > 800
                          ? textStyle2("${searchedModel[index].remarks}", TextAlign.left,
                          ColorManager.blackColor)
                          : textStyle0_5("${searchedModel[index].remarks}", TextAlign.left,
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

