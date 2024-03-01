import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resid_money_transfer/core/app_route/app_route.dart';

import '../../../controller/confrom_passcode_controller.dart';
import '../../../controller/create_passcode_controller.dart';
import '../../../controller/sign_in_controller.dart';
import '../../../controller/sign_up/sign_up_controller.dart';
import '../../../helper/shared_preference_helper.dart';
import '../../../models/sign_up_model.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/keyboard/custom_keyboard.dart';
import '../../widgets/text/custom_text.dart';

class ConformPasscodeScreen extends StatelessWidget {
  ConformPasscodeScreen({super.key});

  ConformPasscodeController conformPasscodeController =
      Get.put(ConformPasscodeController());

  SignUpController signUpController = Get.put(SignUpController());
  SignInController signInController = Get.put(SignInController());

  CreatePasscodeController createPasscodeController =
      Get.put(CreatePasscodeController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        body: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Confirm your passcode".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  bottom: 24.h,
                  top: 100.h,
                ),
                Flexible(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: PinCodeTextField(
                      cursorColor: AppColors.white100,
                      obscureText: true,
                      controller: conformPasscodeController.passcodeController,
                      enablePinAutofill: true,
                      obscuringCharacter: "*",
                      // controller: controller.otpController,
                      appContext: (context),
                      onTap: () {
                        conformPasscodeController.disableKeyboard.value = false;
                      },

                      validator: (value) {
                        if (value!.length != 4) {
                          return null;
                        } else {
                          // return "Please enter passcode".tr;
                        }
                      },

                      onChanged: (controllerText) {
                        if (controllerText.length == 4) {
                          Get.toNamed(AppRoute.transaction) ;

                          // conformPasscodeController.disableKeyboard.value =
                          //     true;
                          //
                          // if (createPasscodeController
                          //         .passcodeController.text ==
                          //     conformPasscodeController
                          //         .passcodeController.text) {
                          //   if (signInController.isSignIn.value) {
                          //     var item =
                          //         signInController.signInModelInfo!.data!;
                          //     conformPasscodeController.createPasscodeRepo(
                          //         item.passcodeToken!,
                          //         SharedPreferenceHelper.id,
                          //         controllerText);
                          //   } else {
                          //     SignUpModel signUpModel =
                          //         signUpController.signUpModelInfo!;
                          //
                          //     conformPasscodeController.createPasscodeRepo(
                          //         signUpModel.data!.passcodeToken!,
                          //         signUpModel.data!.attributes!.sId!,
                          //         controllerText);
                          //   }
                          // } else {
                          //   Get.snackbar(
                          //       "passcode".tr, "Passcode not match".tr);
                          // }
                        }
                      },
                      keyboardType: TextInputType.none,

                      autoFocus: true,
                      showCursor: false,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 12.h,
                        fieldWidth: 12.w,
                        activeFillColor: AppColors.white100,
                        selectedFillColor: AppColors.transparentColor,
                        inactiveFillColor: AppColors.transparentColor,
                        borderWidth: 0.0.w,
                        errorBorderColor: AppColors.primaryColor,
                        selectedColor: AppColors.white100,
                        activeColor: AppColors.transparentColor,
                        inactiveColor: AppColors.white100,
                      ),
                      length: 4,
                      enableActiveFill: true,
                    ),
                  ),
                ),
                const Spacer(),
                Obx(() => conformPasscodeController.disableKeyboard.value
                    ? const SizedBox()
                    : CustomKeyboard(
                        controller:
                            conformPasscodeController.passcodeController,
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
