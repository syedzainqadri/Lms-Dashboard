import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/middle_section_large.dart';
import 'package:lmsadminpanle/views/root/subPages/dashboard/widgets/middleSection/middle_section_small.dart';
import 'package:sizer/sizer.dart';
import 'widgets/revenueSection/revenue_large.dart';
import 'widgets/revenueSection/revenue_small.dart';
import 'widgets/topCards/top_cards_large.dart';
import 'widgets/topCards/top_cards_medium.dart';
import 'widgets/topCards/top_cards_small.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ListView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        // top cards
        if (width > 1366 || width >= 768 && width < 1366)
          if (width <= 1100 && width >= 768)
            const TopCardsMediumWidget()
          else
            const TopCardsLargeWidget()
        else
          const TopCardsSmallWidget(),

        // revenue card
        if (width < 768) RevenueSectionSmall() else RevenueSectionLarge(),

        // earnings card
        if (width < 768)
          const MiddleSectionSmall()
        else
          const MiddleSectionLarge(),

        buildSpaceVertical(10.h),
      ],
    );
  }
}
