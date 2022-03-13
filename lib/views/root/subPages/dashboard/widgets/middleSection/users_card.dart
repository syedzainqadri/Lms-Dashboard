import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/revenueSection/revenue_info.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chart_data.dart';

class UsersCard extends StatefulWidget {
  final double height;
  final bool isLarge;
  const UsersCard({Key? key, required this.height, required this.isLarge})
      : super(key: key);

  @override
  State<UsersCard> createState() => _UsersCardState();
}

class _UsersCardState extends State<UsersCard> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Total Users', 25),
      ChartData('Approved Users', 38),
      ChartData('Pending Users', 34),
      ChartData('Rejected Users', 52)
    ];

    return Expanded(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
          color: ColorManager.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: widget.isLarge
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSpaceVertical(2.h),
                  Center(
                      child: textStyle6(
                          "Users", TextAlign.left, ColorManager.primaryColor)),
                  buildSpaceVertical(2.h),
                  SizedBox(
                    height: 30.h,
                    child: SfCircularChart(series: <CircularSeries>[
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p40),
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  buildSpaceVertical(2.h),
                  Row(
                    children: [
                      RevenueInfo(
                        title: "Total Users",
                        amount: "230",
                        isLarge: widget.isLarge,
                      ),
                      RevenueInfo(
                        title: "Approved Users",
                        amount: "1,100",
                        isLarge: widget.isLarge,
                      ),
                    ],
                  ),
                  buildSpaceVertical(2.h),
                  Row(
                    children: [
                      RevenueInfo(
                        title: "Pending Users",
                        amount: "230",
                        isLarge: widget.isLarge,
                      ),
                      RevenueInfo(
                        title: "Rejected Users",
                        amount: "1,100",
                        isLarge: widget.isLarge,
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textStyle6("Users", TextAlign.center,
                            ColorManager.primaryColor),
                        SizedBox(
                          width: 600,
                          height: 200,
                          child: SfCircularChart(series: <CircularSeries>[
                            PieSeries<ChartData, String>(
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 2,
                    color: ColorManager.primaryColor,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSpaceVertical(6.h),
                        RevenueInfo(
                          title: "Total Users",
                          amount: "230",
                          isLarge: widget.isLarge,
                        ),
                        RevenueInfo(
                          title: "Approved Users",
                          amount: "1,100",
                          isLarge: widget.isLarge,
                        ),
                        RevenueInfo(
                          title: "Pending Users",
                          amount: "230",
                          isLarge: widget.isLarge,
                        ),
                        RevenueInfo(
                          title: "Rejected Users",
                          amount: "1,100",
                          isLarge: widget.isLarge,
                        ),
                        buildSpaceVertical(2.h),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
