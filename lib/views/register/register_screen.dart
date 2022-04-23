import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _passwordVisibleOne = false;
  final bool _passwordVisibleTwo = false;

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
              height: 75.h,
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
                                buildSpaceVertical(2.h),
                                Image.asset(AssetImages.logo,
                                    height: 12.h, width: 30.w),
                                buildSpaceVertical(2.h),
                                CustomTextField(
                                  controller: _nameController,
                                  hintName: StringsManager.name,
                                  isLarge: size.width > 600 ? true : false,
                                ),
                                buildSpaceVertical(2.h),
                                CustomTextField(
                                  controller: _emailController,
                                  hintName: StringsManager.email,
                                  isLarge: size.width > 600 ? true : false,
                                ),
                                buildSpaceVertical(2.h),
                                CustomTextField(
                                  controller: _passwordController,
                                  hintName: StringsManager.passHint,
                                  isPass: true,
                                  isLarge: size.width > 600 ? true : false,
                                  passwordVisibility: _passwordVisibleOne,
                                ),
                                buildSpaceVertical(2.h),
                                CustomTextField(
                                  controller: _confirmPasswordController,
                                  hintName: StringsManager.cPassHint,
                                  isPass: true,
                                  isLarge: size.width > 600 ? true : false,
                                  passwordVisibility: _passwordVisibleTwo,
                                ),
                                buildSpaceVertical(5.h),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      if (_passwordController.text ==
                                          _confirmPasswordController.text) {
                                        _authController.register(
                                          _nameController.text.trim(),
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        );
                                      } else {
                                        errorToast(StringsManager.error,
                                            StringsManager.passUnMatch);
                                      }
                                    }
                                  },
                                  child: actionButton(StringsManager.register,
                                      size.width > 600 ? true : false),
                                ),
                                buildSpaceVertical(4.h),
                                RichText(
                                  text: TextSpan(
                                    text: 'Already Have have an account?  ',
                                    style: GoogleFonts.poppins(
                                      color: ColorManager.grayColor,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Sign In',
                                          style: GoogleFonts.openSans(
                                              color: ColorManager.darkColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed('/');
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
