import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/earnings_card.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/users_card.dart';
import 'package:sizer/sizer.dart';

class MiddleSectionSmall extends StatelessWidget {
  const MiddleSectionSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: SizedBox(
        height: 74.h,
        width: double.infinity,
        child: Column(
          children: [
            UsersCard(height: 35.h, isLarge: false),
            buildSpaceVertical(3.h),
            EarningsCard(height: 35.h, isLarge: false),
          ],
        ),
      ),
    );
  }
}
