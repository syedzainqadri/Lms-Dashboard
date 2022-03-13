import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';

class ProductsTable extends StatelessWidget {
  const ProductsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                buildSpaceVertical(2.h),
                textStyle3("Available Products", TextAlign.left,
                    ColorManager.primaryColor),
              ],
            ),
            DataTable2(
              columnSpacing: 10,
              horizontalMargin: 12,
              minWidth: 800,
              columns: [
                DataColumn(
                  label: width > 800
                      ? textStyle2("Product Name", TextAlign.center,
                          ColorManager.blackColor)
                      : textStyle0_5("Product Name", TextAlign.center,
                          ColorManager.blackColor),
                  // size: ColumnSize.L,
                ),
                DataColumn(
                  label: width > 800
                      ? textStyle2("Category Name", TextAlign.center,
                          ColorManager.blackColor)
                      : textStyle0_5("Category Name", TextAlign.center,
                          ColorManager.blackColor),
                ),
                DataColumn(
                  label: width > 800
                      ? textStyle2(
                          "Status", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "Status", TextAlign.center, ColorManager.blackColor),
                ),
                DataColumn(
                  label: width > 800
                      ? textStyle2(
                          "SKU", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "SKU", TextAlign.center, ColorManager.blackColor),
                ),
                DataColumn(
                  label: width > 800
                      ? textStyle2(
                          "Price", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "Price", TextAlign.center, ColorManager.blackColor),
                ),
                DataColumn2(
                  label: width > 800
                      ? textStyle2(
                          "Actions", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "Actions", TextAlign.center, ColorManager.blackColor),
                  size: ColumnSize.L,
                ),
              ],
              rows: List<DataRow>.generate(
                10,
                (index) => DataRow(cells: [
                  DataCell(width > 800
                      ? textStyle2("Product $index", TextAlign.center,
                          ColorManager.blackColor)
                      : textStyle0_5("Product $index", TextAlign.center,
                          ColorManager.blackColor)),
                  DataCell(width > 800
                      ? textStyle2("Category $index", TextAlign.center,
                          ColorManager.blackColor)
                      : textStyle0_5("Category $index", TextAlign.center,
                          ColorManager.blackColor)),
                  DataCell(width > 800
                      ? textStyle2(
                          "Active", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "Active", TextAlign.center, ColorManager.blackColor)),
                  DataCell(width > 800
                      ? textStyle2(
                          "9234339", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5("9234339", TextAlign.center,
                          ColorManager.blackColor)),
                  DataCell(width > 800
                      ? textStyle2(
                          "\$300", TextAlign.center, ColorManager.blackColor)
                      : textStyle0_5(
                          "\$300", TextAlign.center, ColorManager.blackColor)),
                  DataCell(Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.visibility),
                        color: ColorManager.primaryColor,
                        iconSize: 24,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: ColorManager.bluishColor,
                        iconSize: 24,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: ColorManager.redColor,
                        iconSize: 24,
                        onPressed: () {},
                      ),
                    ],
                  )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
