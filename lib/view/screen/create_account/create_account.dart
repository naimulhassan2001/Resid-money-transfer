import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controller/sign_up/sign_up_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';
import 'inner_widget/create_account_all_filed.dart';
import 'inner_widget/create_account_rich_Text.dart';
import 'inner_widget/already_have_account.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  SignUpController signUpController = Get.put(SignUpController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var h = height / 852;

    return Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,

        // Main Code
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: InkWell(
              onTap: () => Get.toNamed(AppRoute.languageScreen),
              child: CustomImage(
                  imageSrc: AppIcons.language,
                  imageColor: AppColors.white,
                  size: 20.sp),
            ),
          ),
          title: InkWell(
            onTap: () => Get.toNamed(AppRoute.languageScreen),
            child: CustomText(
                text: "English".tr,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400),
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(AppRoute.legalScreen),
                  child: Row(
                    children: [
                      CustomText(
                          text: "Legal terms".tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          right: 4.w),
                      CustomImage(
                        imageSrc: AppIcons.legalTerms,
                        imageColor: AppColors.white,
                        size: 20.sp,
                      ),
                      SizedBox(
                        width: 15.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        // sir redesign

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Create your account".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      bottom: 15 * h,
                    ),
                    CreateAccountAllFiled(),
                    const Align(
                        alignment: Alignment.center,
                        child: CreateAccountTermsConditions()),
                    SizedBox(
                      height: 36 * h,
                    ),
                    Obx(() => signUpController.isLoadingSignUpScreen.value
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            titleText: "Sign up".tr,
                            buttonHeight: 60 * h,
                            titleSize: 16.sp,
                            buttonWidth: double.infinity,
                            titleWeight: FontWeight.w700,
                            onPressed: () {

                              Get.toNamed(AppRoute.signUpOtp);

                              //
                              // if (signUpController
                              //     .numberController.text.isEmpty) {
                              //   Utils.toastMessage("Invalid Mobile Number".tr);
                              // }
                              //
                              // if (formKey.currentState!.validate()) {
                              //   if (signUpController
                              //       .numberController.text.isNotEmpty) {
                              //     signUpController.otpController.text = "";
                              //     signUpController.signUpRepo();
                              //   }
                              // }
                              //

                            },
                          )),
                    SizedBox(
                      height: 10 * h,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: AlreadyHaveAccount()),
                    SizedBox(
                      height: 16 * h,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
