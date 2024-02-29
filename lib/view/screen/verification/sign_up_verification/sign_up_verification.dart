import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../controller/sign_up/sign_up_controller.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_utils.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/loading_container/loading_container.dart';
import '../../../widgets/resend_rich_text/resend_rich_text.dart';
import '../../../widgets/rich_text/rich_text.dart';
import '../../../widgets/text/custom_text.dart';

class SignUpVerification extends StatelessWidget {
  SignUpVerification({super.key});

  SignUpController signUpController = Get.put(SignUpController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    signUpController.isLoading.value = false;



    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: double.maxFinite,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Enter the verification code".tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    bottom: 9.h,
                  ),
                  TextRichWidget(
                      firstText:
                          "Please enter the 6-digit code sent to your email "
                              .tr,
                      firstColor: AppColors.white50,
                      secondText: signUpController.emailController.text,
                      secondColor: AppColors.white75,
                      thirdText: " to verify your email.".tr,
                      thirdColor: AppColors.white50),
                  SizedBox(
                    height: 24.h,
                  ),
                  Flexible(
                    flex: 0,
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      cursorColor: AppColors.white100,
                      controller: signUpController.otpController,
                      appContext: (context),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Please enter the OTP code.".tr;
                        } else {}
                      },
                      autoFocus: true,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50.h,
                        fieldWidth: 46.w,
                        activeFillColor: AppColors.transparentColor,
                        selectedFillColor: AppColors.transparentColor,
                        inactiveFillColor: AppColors.transparentColor,
                        borderWidth: 0.5.w,
                        errorBorderColor: AppColors.primaryColor,
                        selectedColor: AppColors.white100,
                        activeColor: AppColors.white100,
                        inactiveColor: AppColors.white100,
                      ),
                      length: 6,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.disabled,
                      enableActiveFill: true,
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Obx(() => Center(
                        child: signUpController.isLoading.value
                            ? LoadingContainer(
                                width: 200.w,
                              )
                            : CustomButton(
                                titleText: "Verify".tr,
                                buttonWidth: 200.w,
                                buttonRadius: 10.r,
                                titleSize: 14.sp,
                                onPressed: () {

                                  Get.toNamed(AppRoute.passCode);

                                  //
                                  // if (formKey.currentState!.validate()) {
                                  //   signUpController.signUpAuthRepo();
                                  // }


                                }),
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: Obx(() => ResendRichText(
                                    color: signUpController.isResend.value
                                        ? AppColors.primaryColor
                                        : AppColors.gray,
                                    onTap: signUpController.isResend.value
                                        ? () {
                                            signUpController.isResend.value =
                                                false;

                                            signUpController.signUpRepo();
                                            Utils.snackBarMessage(
                                                "Resend", "Resend Code");
                                          }
                                        : () {
                                            Utils.toastMessage(
                                                "please wait ${signUpController.formattedDuration()}");
                                          },
                                  )))),
                    ],
                  ),
                  Obx(() => CustomText(
                      text:
                          "${"YouCanResendTheCodeIn".tr}  ${signUpController.formattedDuration()}",
                      fontSize: 16.sp,
                      top: 8.h,
                      style: true,
                      color: AppColors.white50,
                      maxLines: 2)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
