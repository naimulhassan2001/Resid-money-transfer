import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../helper/shared_preference_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            CustomText(
              text: "Reset your passcode by logging in again".tr,
              fontSize: 24.sp,
              maxLines: 3,
              top: 16.h,
              bottom: 100.h,
            ),
            GestureDetector(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();

                sharedPreferenceHelper.logOut() ;
                pref.setBool("isForgotPasscode", true);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomImage(imageSrc: AppIcons.logOut),
                  CustomText(
                    text: "Log out".tr,
                    fontSize: 24.sp,
                    left: 16.w,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
