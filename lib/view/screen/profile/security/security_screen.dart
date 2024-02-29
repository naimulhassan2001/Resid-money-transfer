import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/security_controller.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../helper/shared_preference_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';


class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});

  SecurityController securityController = Get.put(SecurityController());
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Security".tr, fontSize: 24.sp, bottom: 42.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: CustomText(
                              text: "Fingerprint/ Face id to unlock".tr,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              right: 24.w)),
                      AdvancedSwitch(
                        controller: securityController.controller,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.white50,

                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        width: 54.0,
                        height: 26.0,
                        enabled: true,
                        disabledOpacity: 0.5,
                      ),
                      // ...
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.changePasscode);
                    },
                    child: CustomText(
                        text: "Change passcode".tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        top: 12.h,
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                sharedPreferenceHelper.logOut() ;
                                Navigator.pop(context);
                              },
                              child: const Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")),
                        ],
                      );
                    },
                  );
                },
                // onTap: () => sharedPreferenceHelper.logOut(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImage(imageSrc: AppIcons.logOut, size: 18.h, imageColor: AppColors.primaryColor,),
                    CustomText(
                        text: "Log out".tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor,
                        left: 10.w),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
