// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:lmsadminpanle/utils/constants/color_manager.dart';
// import 'package:lmsadminpanle/utils/constants/values_manager.dart';
// import 'package:lmsadminpanle/utils/helpers/helper.dart';
// import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
// import 'package:sizer/sizer.dart';

// class UsersTable extends StatelessWidget {
//   const UsersTable({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: AppPadding.p12, vertical: AppPadding.p12),
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorManager.whiteColor,
//           border: Border.all(
//               color: ColorManager.primaryColor.withOpacity(.4), width: .5),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(0, 6),
//                 color: ColorManager.grayColor.withOpacity(.1),
//                 blurRadius: 12)
//           ],
//           borderRadius: BorderRadius.circular(8),
//         ),
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.only(bottom: 30),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 buildSpaceVertical(2.h),
//                 textStyle3(
//                     "All Users", TextAlign.left, ColorManager.primaryColor),
//               ],
//             ),
//             DataTable2(
//               columnSpacing: 10,
//               horizontalMargin: 12,
//               minWidth: 1000,
//               columns: [
//                 DataColumn(
//                   label: width > 800
//                       ? textStyle2(
//                           "Name", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "Name", TextAlign.center, ColorManager.blackColor),
//                   // size: ColumnSize.L,
//                 ),
//                 DataColumn2(
//                   label: width > 800
//                       ? textStyle2(
//                           "Email", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "Email", TextAlign.center, ColorManager.blackColor),
//                   size: ColumnSize.L,
//                 ),
//                 DataColumn(
//                   label: width > 800
//                       ? textStyle2(
//                           "Phone No", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5("Phone No", TextAlign.center,
//                           ColorManager.blackColor),
//                 ),
//                 DataColumn(
//                   label: width > 800
//                       ? textStyle2(
//                           "Address", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "Address", TextAlign.center, ColorManager.blackColor),
//                 ),
//                 DataColumn(
//                   label: width > 800
//                       ? textStyle2(
//                           "City", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "City", TextAlign.center, ColorManager.blackColor),
//                 ),
//                 DataColumn(
//                   label: width > 800
//                       ? textStyle2(
//                           "Country", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "Country", TextAlign.center, ColorManager.blackColor),
//                 ),
//                 DataColumn2(
//                   label: width > 800
//                       ? textStyle2(
//                           "Approval", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5("Approval", TextAlign.center,
//                           ColorManager.blackColor),
//                   size: ColumnSize.L,
//                 ),
//                 DataColumn2(
//                   label: width > 800
//                       ? textStyle2(
//                           "Actions", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5(
//                           "Actions", TextAlign.center, ColorManager.blackColor),
//                   size: ColumnSize.L,
//                 ),
//               ],
//               rows: List<DataRow>.generate(
//                 10,
//                 (index) => DataRow(cells: [
//                   DataCell(width > 800
//                       ? textStyle2("Zain Khan", TextAlign.center,
//                           ColorManager.blackColor)
//                       : textStyle0_5("Zain Khan", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(width > 800
//                       ? textStyle2("kzain3714@gmail.com", TextAlign.center,
//                           ColorManager.blackColor)
//                       : textStyle0_5("kzain3714@gmail.com", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(width > 800
//                       ? textStyle2("0312398457883", TextAlign.center,
//                           ColorManager.blackColor)
//                       : textStyle0_5("0312398457883", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(width > 800
//                       ? textStyle2("Saddar bazar Peshawar", TextAlign.center,
//                           ColorManager.blackColor)
//                       : textStyle0_5("Saddar bazar Peshawar", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(width > 800
//                       ? textStyle2(
//                           "Peshawar", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5("Peshawar", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(width > 800
//                       ? textStyle2(
//                           "Pakistan", TextAlign.center, ColorManager.blackColor)
//                       : textStyle0_5("Pakustan", TextAlign.center,
//                           ColorManager.blackColor)),
//                   DataCell(Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 5.h,
//                           decoration: BoxDecoration(
//                             color: ColorManager.primaryColor,
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color:
//                                     ColorManager.primaryColor.withOpacity(0.2),
//                                 spreadRadius: 4,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Approve",
//                               style: TextStyle(
//                                 color: ColorManager.whiteColor,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       buildSpaceHorizontal(2.w),
//                       Expanded(
//                         child: Container(
//                           height: 5.h,
//                           decoration: BoxDecoration(
//                             color: ColorManager.redColor,
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(10),
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: ColorManager.redColor.withOpacity(0.2),
//                                 spreadRadius: 4,
//                                 blurRadius: 7,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: const Center(
//                             child: Text(
//                               "Reject",
//                               style: TextStyle(
//                                 color: ColorManager.whiteColor,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.normal,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//                   DataCell(Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.visibility),
//                         color: ColorManager.primaryColor,
//                         iconSize: 24,
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.edit),
//                         color: ColorManager.bluishColor,
//                         iconSize: 24,
//                         onPressed: () {},
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete),
//                         color: ColorManager.redColor,
//                         iconSize: 24,
//                         onPressed: () {},
//                       ),
//                     ],
//                   )),
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
