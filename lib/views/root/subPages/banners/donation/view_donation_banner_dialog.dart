
import 'package:flutter/material.dart';
import 'package:lmsadminpanle/models/donation_banner_model.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../../../../controllers/donation/get_donation_banner_controller.dart';

class ViewDonationBannerDialog extends StatefulWidget {
  final String id;
  const ViewDonationBannerDialog({Key? key, required this.id}) : super(key: key);

  @override
  _ViewDonationBannerDialogState createState() => _ViewDonationBannerDialogState();
}

class _ViewDonationBannerDialogState extends State<ViewDonationBannerDialog> {
  final _eventUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String url = '';
  bool status = false;
  final GetDonationBannerController _homeTopBannerController = Get.put(GetDonationBannerController());
  DonationBannerModel? bannerModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    bannerModel = await _homeTopBannerController.getHomeTopBannerData(widget.id);
    setState(() {
      _eventUrlController.text = bannerModel!.eventUrl!;
      url = bannerModel!.url!;
      status = bannerModel!.status!;
    });
  }

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
        height: size.height * 0.80,
        width: size.width * 0.7,
        child: Obx(() {
          return _homeTopBannerController.isLoading.isTrue ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSpaceVertical(2.h),
                  Center(
                      child: textStyle4("View Donation Banner", TextAlign.center,
                          ColorManager.darkColor)),
                  buildSpaceVertical(2.h),
                  Center(child: Image.network(url, height: 200, width: 350)),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                      controller: _eventUrlController,
                      hintName: StringsManager.eventUrl,
                      isLarge: size.width > 800 ? true : false,
                      isEnable: false
                  ),

                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textStyle3(StringsManager.status, TextAlign.center, ColorManager.darkColor),
                        ToggleSwitch(
                          customWidths: const [50.0, 50.0],
                          cornerRadius: 20.0,
                          initialLabelIndex: status ? 0 : 1,
                          activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          totalSwitches: 2,
                          labels: const ['YES', 'NO'],
                          onToggle: (index) {
                            if(index == 0){
                              status = true;
                            }else{
                              status = false;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  buildSpaceVertical(2.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 2),
                    child: const Divider(
                        height: 1, thickness: 1, color: ColorManager.darkColor),
                  ),
                  buildSpaceVertical(2.h),
                  buildSpaceVertical(1.h),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}