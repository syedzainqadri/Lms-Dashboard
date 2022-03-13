import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/earnings_card.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/users_card.dart';
import 'package:sizer/sizer.dart';

class MiddleSectionLarge extends StatelessWidget {
  const MiddleSectionLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12, vertical: AppPadding.p4),
      child: SizedBox(
        height: 67.h,
        width: double.infinity,
        child: Row(
          children: [
            UsersCard(height: 67.h, isLarge: true),
            buildSpaceHorizontal(5.w),
            EarningsCard(height: 67.h, isLarge: true),
          ],
        ),
      ),
    );
  }
}
