import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'chart_samle_data.dart';
import 'revenue_info.dart';

// ignore: must_be_immutable
class RevenueSectionSmall extends StatelessWidget {
  RevenueSectionSmall({Key? key}) : super(key: key);

  TooltipBehavior? _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        format: 'point.x : point.y sq.km',
        header: '');

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p10, vertical: AppPadding.p10),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p22),
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 6),
                color: Colors.grey.withOpacity(.1),
                blurRadius: 12)
          ],
          border: Border.all(color: ColorManager.grayColor, width: .5),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 260,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textStyle6("Revenue Chart", TextAlign.center,
                      ColorManager.primaryColor),
                  SizedBox(
                      width: 600,
                      height: 200,
                      child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                          labelStyle:
                              const TextStyle(color: ColorManager.primaryColor),
                          axisLine: const AxisLine(width: 0),
                          labelPosition: ChartDataLabelPosition.outside,
                          majorTickLines: const MajorTickLines(width: 0),
                          majorGridLines: const MajorGridLines(width: 0),
                        ),
                        primaryYAxis: NumericAxis(
                            isVisible: true, minimum: 0, maximum: 10000),
                        series: _getRoundedColumnSeries(),
                        tooltipBehavior: _tooltipBehavior,
                      )),
                ],
              ),
            ),
            Container(
              width: 120,
              height: 1,
              color: ColorManager.grayColor,
            ),
            SizedBox(
              height: 260,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const [
                      RevenueInfo(
                        title: "Today\'s revenue",
                        amount: "\$230",
                        isLarge: false,
                      ),
                      RevenueInfo(
                        title: "Last 7 days",
                        amount: "\$1,100",
                        isLarge: false,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      RevenueInfo(
                        title: "Last 30 days",
                        amount: "\$3,230",
                        isLarge: false,
                      ),
                      RevenueInfo(
                        title: "Last 12 months",
                        amount: "\$11,300",
                        isLarge: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getRoundedColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        width: 0.4,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'January', y: 8683),
          ChartSampleData(x: 'February', y: 6993),
          ChartSampleData(x: 'March', y: 5498),
          ChartSampleData(x: 'April', y: 5083),
          ChartSampleData(x: 'May', y: 4497),
        ],
        borderRadius: BorderRadius.circular(5),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
      ),
    ];
  }
}
