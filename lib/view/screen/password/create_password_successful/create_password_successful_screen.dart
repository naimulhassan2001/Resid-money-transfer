import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/text/custom_text.dart';

class CreatePasswordSuccessfulScreen extends StatelessWidget {
  const CreatePasswordSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Reset Password".tr,
                fontSize: 20.sp,
                top: 29.h,
                bottom: 19.h,
              ),
              CustomText(
                text:
                    "Your password has been successfully reset.Now your can log in using your new password."
                        .tr,
                fontSize: 18.sp,
                maxLines: 5,
                style: true,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: CustomButton(
            titleText: "Sign in".tr,
            buttonRadius: 10.r,
            onPressed: () {
              Get.toNamed(AppRoute.logIn);
            }),
      ),
    );
  }
}
