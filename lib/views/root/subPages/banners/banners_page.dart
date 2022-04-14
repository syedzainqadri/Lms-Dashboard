import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/donation/add_donation_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/donation/donation_banner_table.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/eventDetail/add_eventDetail_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/eventDetail/eventDetail_banner_table.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/feedback/add_feedback_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/homeBottomBanner/add_home_bottom_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/homeBottomBanner/home_bottom_banner_table.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/homeTopBanner/home_top_banner_table.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/volunteer/add_volunteer_banner_dialog.dart';
import 'package:lmsadminpanle/views/root/subPages/banners/volunteer/volunteer_banner_table.dart';
import 'package:lmsadminpanle/views/root/subPages/categories/widgets/add_button.dart';

import 'feedback/feedback_banner_table.dart';
import 'homeTopBanner/add_home_top_banner_dialog.dart';

class BannersPage extends StatelessWidget {
  const BannersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: Column(
          children: [
            // home top banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Home Top Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddHomeTopBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add Home Top Banner", width > 800 ? false : true)),
              ],
            ),
            const HomeTopBannerTable(),

            // home bottom banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Home Bottom Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddHomeBottomBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add Home Bottom Banner", width > 800 ? false : true)),
              ],
            ),
            const HomeBottomBannerTable(),

            // donation banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Donation Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddDonationBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add Donation Banner", width > 800 ? false : true)),
              ],
            ),
            const DonationBannerTable(),

            // feedback banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Feedback Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddFeedbackBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add Feedback Banner", width > 800 ? false : true)),
              ],
            ),
            const FeedbackBannerTable(),

            // volunteer banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Volunteer Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddVolunteerBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add Volunteer Banner", width > 800 ? false : true)),
              ],
            ),
            const VolunteerBannerTable(),

            // event detail banner
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textStyle4("Event Detail Banner", TextAlign.left, ColorManager.primaryColor),
                InkWell(
                    onTap: () {
                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (context) {
                          return const AddEventDetailBannerDialog();
                        },
                      );
                    },
                    child: addButton("Add EventDetail Banner", width > 800 ? false : true)),
              ],
            ),
            const EventDetailBannerTable(),
          ],
        ),
      ),
    );
  }
}