import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lmsadminpanle/controllers/auth_controller.dart';
import 'package:lmsadminpanle/utils/constants/assets_manager.dart';
import 'package:lmsadminpanle/utils/constants/color_manager.dart';
import 'package:lmsadminpanle/utils/constants/strings_manager.dart';
import 'package:lmsadminpanle/utils/constants/values_manager.dart';
import 'package:lmsadminpanle/utils/helpers/helper.dart';
import 'package:lmsadminpanle/utils/helpers/text_helper.dart';
import 'package:lmsadminpanle/widgets/action_button.dart';
import 'package:lmsadminpanle/widgets/text_field.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _passwordVisibleOne = false;

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
                return _authController.isLoading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(
                            value: 20,
                            backgroundColor: ColorManager.grayColor,
                            color: ColorManager.primaryColor))
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
                                    height: 15.h, width: 30.w),
                                buildSpaceVertical(4.h),
                                CustomTextField(
                                  controller: _emailController,
                                  hintName: StringsManager.email,
                                  icon: Icons.email,
                                  isLarge: size.width > 600 ? true : false,
                                ),
                                buildSpaceVertical(2.h),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintName: StringsManager.passHint,
                                  icon: Icons.lock,
                                  isPass: true,
                                  isLarge: size.width > 600 ? true : false,
                                  passwordVisibility: _passwordVisibleOne,
                                ),
                                buildSpaceVertical(2.h),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: size.width > 600
                                          ? AppPadding.p40
                                          : size.width > 400
                                              ? AppPadding.p20
                                              : AppPadding.p20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/forgotPass');
                                        },
                                        child: textStyle1_5(
                                            StringsManager.forgotPass,
                                            TextAlign.right,
                                            ColorManager.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                                buildSpaceVertical(3.h),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _authController.login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                      );
                                    }
                                  },
                                  child: actionButton(StringsManager.login,
                                      size.width > 600 ? true : false),
                                ),
                                buildSpaceVertical(4.h),
                                RichText(
                                  text: TextSpan(
                                    text: 'Don\'t have an account?  ',
                                    style: GoogleFonts.poppins(
                                      color: ColorManager.grayColor,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Sign Up',
                                          style: GoogleFonts.openSans(
                                              color: ColorManager.primaryColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed('/register');
                                            }),
                                    ],
                                  ),
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
