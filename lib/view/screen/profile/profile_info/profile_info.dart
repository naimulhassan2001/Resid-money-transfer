import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/personal_info_controller.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../helper/shared_preference_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';


class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

  PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());

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
          body: Obx(() => personalInfoController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : personalInfoController.userDetailsModelInfo == null
                  ? Center(
                      child: Text("data not found".tr),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "Personal info".tr,
                                  fontSize: 24.sp,
                                  bottom: 42.h),
                              Container(
                                height: 75.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white50,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 0.5.w),
                                ),
                                child: Center(
                                  child: CustomText(
                                      text: personalInfoController
                                              .userDetailsModelInfo
                                              ?.data
                                              ?.attributes
                                              ?.fullName?[0] ??
                                          "",
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              CustomText(
                                text: personalInfoController
                                        .userDetailsModelInfo
                                        ?.data
                                        ?.attributes
                                        ?.fullName ??
                                    "",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                top: 16.h,
                                bottom: 42.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Mobile number".tr,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white50,
                                bottom: 4.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text:
                                        "${personalInfoController.userDetailsModelInfo?.data?.attributes?.countryCode ?? ""}${personalInfoController.userDetailsModelInfo?.data?.attributes?.phoneNumber}" ??
                                            "",
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        personalInfoController.numberController
                                            .text = personalInfoController
                                                .userDetailsModelInfo
                                                ?.data
                                                ?.attributes
                                                ?.phoneNumber ??
                                            "";

                                        Get.toNamed(AppRoute.changePhoneNumber);
                                      },
                                      icon: CustomImage(
                                          imageSrc: AppIcons.edit, size: 18.h))
                                ],
                              ),
                              SizedBox(height: 24.h),
                              CustomText(
                                text: "Email".tr,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white50,
                                bottom: 4.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: CustomText(
                                      text: personalInfoController
                                              .userDetailsModelInfo
                                              ?.data
                                              ?.attributes
                                              ?.email ??
                                          "",
                                      fontSize: 18.sp,
                                      maxLines: 1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  // CustomImage(
                                  //     imageSrc: AppIcons.edit, size: 18.h)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ))),
    );
  }
}
