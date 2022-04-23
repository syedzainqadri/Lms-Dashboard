import 'package:flutter/material.dart';
import 'package:lmsadminpanle/controllers/auth_controller.dart';
import 'package:lmsadminpanle/utils/constants/assets_manager.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/widgets/action_button.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorManager.secondaryColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width > 600
                  ? AppPadding.p40
                  : size.width > 400
                      ? AppPadding.p20
                      : AppPadding.p4),
          child: Center(
            child: Container(
              height: 65.h,
              width: size.width > 400 ? 60.w : 95.w,
              decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(AppSize.s10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(AppSize.s0_5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Obx(() {
                return _authController.isRLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(
                            value: 20,
                            backgroundColor: ColorManager.grayColor,
                            color: ColorManager.darkColor))
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width > 600
                                  ? AppPadding.p40
                                  : size.width > 400
                                      ? AppPadding.p20
                                      : AppPadding.p4),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                buildSpaceVertical(4.h),
                                Image.asset(AssetImages.logo,
                                    height: 25.h, width: 40.w),
                                buildSpaceVertical(4.h),
                                CustomTextField(
                                  controller: _emailController,
                                  hintName: StringsManager.email,
                                  isLarge: size.width > 600 ? true : false,
                                ),
                                buildSpaceVertical(5.h),
                                InkWell(
                                  onTap: () {
                                    if (validateEmail(
                                        _emailController.text.trim())) {
                                      _authController.sendResetMail(
                                          _emailController.text.trim());
                                    } else {
                                      errorToast(StringsManager.error,
                                          StringsManager.wrongEmail);
                                    }
                                  },
                                  child: actionButton(StringsManager.continued,
                                      size.width > 600 ? true : false),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
