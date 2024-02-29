import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resid_money_transfer/utils/app_icons.dart';
import 'package:resid_money_transfer/utils/app_images.dart';
import 'package:resid_money_transfer/view/widgets/image/custom_image.dart';


import '../../../../controller/forget_password_controller.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../models/forget_password_otp_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/custom_text_field/custom_text_field.dart';
import '../../../widgets/loading_container/loading_container.dart';
import '../../../widgets/text/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Reset Password".tr,
                  fontSize: 20.sp,
                  top: 29.h,
                  fontWeight: FontWeight.w600,
                  bottom: 32.h,
                ),
                CustomText(
                  text: "New password".tr,
                  fontSize: 14.r,
                  style: true,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  bottom: 4.h,
                ),
                CustomTextField(
                  controller: forgetPasswordController.passwordController,
                  fillColor: AppColors.gray80,
                  isPassword: true,
                  hintText: "Enter your new password".tr,
                  validator: (value) {
                    return forgetPasswordController.validatePassword(value) ;
                  },
                ),
                CustomText(
                  text: "ConfirmPassword".tr,
                  fontSize: 14.r,
                  style: true,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  top: 24.h,
                  bottom: 4.h,
                ),
                CustomTextField(
                  controller:
                      forgetPasswordController.confirmPasswordController,
                  fillColor: AppColors.gray80,
                  isPassword: true,
                  hintText: "Confirm your new password".tr,
                  validator: (value) {
                    if (forgetPasswordController.passwordController.text == forgetPasswordController.confirmPasswordController.text) {
                      return null;
                    } else {
                      return "password do not match";
                    }
                  },
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => forgetPasswordController.whatsAppTo(),
                      child: CustomImage(imageSrc: AppImages.whatsapp, imageType: ImageType.png, size: 50.sp,)),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Obx(() => forgetPasswordController.isLoading.value
            ? LoadingContainer()
            : CustomButton(
            titleText: "Reset Password".tr,
            buttonRadius: 10.r,
            onPressed: () {

              Get.toNamed(AppRoute.createSuccessful);

              // if (formKey.currentState!.validate()) {
              //   ForgetPasswordOtpModel forgetPasswordOtpModel =
              //   forgetPasswordController.forgetPasswordOtpInfo!;
              //   forgetPasswordController.resetPasswordRepo(
              //       forgetPasswordOtpModel.data!.forgetPasswordToken!);
              // }


            })),
      ),
    );
  }
}
