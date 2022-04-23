import 'package:flutter/material.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../../../controllers/feedback/delete_feedback_banner_controller.dart';

class DeleteFeedbackBannerDialog extends StatefulWidget {
  final String id;
  const DeleteFeedbackBannerDialog({Key? key, required this.id}) : super(key: key);
  @override
  _DeleteFeedbackBannerDialogState createState() => _DeleteFeedbackBannerDialogState();
}

class _DeleteFeedbackBannerDialogState extends State<DeleteFeedbackBannerDialog> {

  final DeleteFeedbackBannerController _deleteHomeTopBannerController = Get.put(DeleteFeedbackBannerController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      backgroundColor: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: size.height * 0.24,
        width: size.width * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSpaceVertical(2.h),
            Center(child: textStyle4("Delete Feedback Banner", TextAlign.center, ColorManager.darkColor)),
            buildSpaceVertical(2.h),
            Center(child: textStyle2("Are you sure to Delete?", TextAlign.center, ColorManager.darkColor)),
            buildSpaceVertical(2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 2),
              child: const Divider(
                  height: 1, thickness: 1, color: ColorManager.darkColor),
            ),
            buildSpaceVertical(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      _deleteHomeTopBannerController.deleteHomeTopBanner(widget.id);
                      Get.offAllNamed('/root');
                    },
                    child: Container(
                        height: 5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          color: ColorManager.darkColor,
                        ),
                        child: Obx(() {
                          return _deleteHomeTopBannerController.isUpdatingEvent.isTrue ? const Center(child: CircularProgressIndicator()):
                          Center(
                            child: textStyle3("DELETE", TextAlign.center,
                                ColorManager.whiteColor),
                          );
                        })
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.redColor,
                      ),
                      child: Center(
                        child: textStyle3("CANCEL", TextAlign.center,
                            ColorManager.whiteColor),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
            buildSpaceVertical(1.h),
          ],
        ),
      ),
    );
  }
}
