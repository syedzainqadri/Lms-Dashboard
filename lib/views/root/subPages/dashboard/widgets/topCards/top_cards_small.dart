import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:sizer/sizer.dart';

import 'info_card.dart';

class TopCardsSmallWidget extends StatelessWidget {
  const TopCardsSmallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p10, vertical: AppPadding.p10),
      child: SizedBox(
        height: 65.h,
        child: Column(
          children: [
            const InfoCard(
              title: "Total Categories",
              value: "10",
              icon: Icons.assignment_turned_in,
              cardColor: ColorManager.primaryColor,
            ),
            SizedBox(
              height: _width / 64,
            ),
            const InfoCard(
              title: "Total Products",
              value: "15",
              icon: Icons.assignment_turned_in,
              cardColor: ColorManager.primaryColor,
            ),
            SizedBox(
              height: _width / 64,
            ),
            const InfoCard(
              title: "Total Orders",
              value: "02",
              icon: Icons.assignment_turned_in,
              cardColor: ColorManager.primaryColor,
            ),
            SizedBox(
              height: _width / 64,
            ),
            const InfoCard(
              title: "Cancelled Orders",
              value: "\$ 100",
              icon: Icons.assignment_turned_in,
              cardColor: ColorManager.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
