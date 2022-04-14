import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
import '../../../../../controllers/donation/update_donation_banner_controller.dart';

class EditDonationBannerDialog extends StatefulWidget {
  final String id;
  const EditDonationBannerDialog({Key? key, required this.id}) : super(key: key);

  @override
  _EditDonationBannerDialogState createState() => _EditDonationBannerDialogState();
}

class _EditDonationBannerDialogState extends State<EditDonationBannerDialog> {
  final _eventUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String url = '';
  bool status = false;
  final GetDonationBannerController _homeTopBannerController = Get.put(GetDonationBannerController());
  final UpdateDonationBannerController _updateHomeTopBannerController = Get.put(UpdateDonationBannerController());
  DonationBannerModel? bannerModel;
  XFile? image, photo;
  String? imageUrl;
  File? file;
  final ImagePicker _picker = ImagePicker();


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
                      child: textStyle4("Edit Donation Banner", TextAlign.center,
                          ColorManager.primaryColor)),
                  buildSpaceVertical(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(url, height: 200, width: 250),
                      buildSpaceHorizontal(5.w),
                      InkWell(
                        onTap: () => getImage(),
                        child: Center(
                          child: Container(
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              color: ColorManager.primaryColor,
                            ),
                            child: Center(
                                child: textStyle2("Update Image", TextAlign.center,
                                    ColorManager.whiteColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  buildSpaceVertical(2.h),
                  CustomTextField(
                    controller: _eventUrlController,
                    hintName: StringsManager.eventUrl,
                    icon: Icons.description,
                    isLarge: size.width > 800 ? true : false,
                  ),
                  buildSpaceVertical(2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textStyle3(StringsManager.status, TextAlign.center, ColorManager.primaryColor),
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
                        height: 1, thickness: 1, color: ColorManager.primaryColor),
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
                            _updateHomeTopBannerController.updateHomeTopBanner(widget.id, _eventUrlController.text, imageUrl,status);
                            Get.offAllNamed('/root');
                          },
                          child: Container(
                              height: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s10),
                                color: ColorManager.primaryColor,
                              ),
                              child: Obx(() {
                                return _updateHomeTopBannerController.isUpdatingEvent.isTrue ? const Center(child: CircularProgressIndicator()):
                                Center(
                                  child: textStyle3("UPDATE", TextAlign.center,
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
        }),
      ),
    );
  }

  getImage() async {
    photo = await _picker.pickImage(source: ImageSource.gallery);
    PickedFile? pickedFile;
    if (photo != null) {
      image = photo;
      file = File(image!.path);
      pickedFile = PickedFile(file!.path);
      await uploadImageToStorage(pickedFile);
    }
  }

  uploadImageToStorage(PickedFile? pickedFile) async {
    DateTime dateTime = DateTime.now();
    Reference reference = FirebaseStorage.instance.ref().child("DonationBanner/$dateTime");
    await reference.putData(await pickedFile!.readAsBytes(), SettableMetadata(contentType: 'image/jpeg'));
    imageUrl = await reference.getDownloadURL();
    print(imageUrl);
    setState(() {});
  }

}
