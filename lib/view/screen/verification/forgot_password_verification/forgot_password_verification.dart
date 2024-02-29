import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../controller/forget_password_controller.dart';
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

class ForgotPasswordVerification extends StatelessWidget {
  ForgotPasswordVerification({super.key});

  final formKey = GlobalKey<FormState>();
  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
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
                      bottom: 16.h),
                  TextRichWidget(
                      firstText:
                          "Please enter the 6-digit code sent to your email "
                              .tr,
                      firstColor: AppColors.white50,
                      secondText: forgetPasswordController.emailController.text,
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
                      controller: forgetPasswordController.otpController,
                      cursorColor: AppColors.white100,
                      // controller: controller.otpController,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Obx(() => forgetPasswordController.isLoading.value
                        ? LoadingContainer(
                            width: 220.w,
                          )
                        : CustomButton(
                            titleText: "Verify".tr,
                            buttonRadius: 10.r,
                            titleSize: 16.sp,
                            buttonWidth: 220.w,
                            onPressed: () {

                              Get.toNamed(AppRoute.newPassword);


                              // if (formKey.currentState!.validate()) {
                              //   forgetPasswordController.verifyOtpRepo();
                              // }


                            },
                          )),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: Align(
                              alignment: Alignment.center,
                              child: Obx(() => ResendRichText(
                                    color:
                                        forgetPasswordController.isResend.value
                                            ? AppColors.primaryColor
                                            : AppColors.gray,
                                    onTap:
                                        forgetPasswordController.isResend.value
                                            ? () {
                                                forgetPasswordController
                                                    .isResend.value = false;
                                                forgetPasswordController
                                                    .forgetPasswordRepo();
                                                Utils.snackBarMessage(
                                                    "Resend", "Resend Code");
                                              }
                                            : () {
                                                Utils.toastMessage(
                                                    "please wait ${forgetPasswordController.formattedDuration()}");
                                              },
                                  )))),
                    ],
                  ),
                  Obx(
                    () => CustomText(
                        text:
                            "${"YouCanResendTheCodeIn".tr}   ${forgetPasswordController.formattedDuration()}",
                        fontSize: 16.sp,
                        top: 8.h,
                        style: true,
                        color: AppColors.white40,
                        maxLines: 2),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
