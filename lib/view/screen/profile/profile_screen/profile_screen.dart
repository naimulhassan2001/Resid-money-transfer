import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/personal_info_controller.dart';
import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';
import 'inner_widget/profile_screen_item.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());
  @override
  void initState() {
    // personalInfoController.userDetailsRepo();
    // TODO: implement initState
    super.initState();
  }



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
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 75.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                          color: AppColors.white50,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 0.5.w),
                        ),
                        child: Center(
                            child: CustomText(
                                text: personalInfoController
                                        .userDetailsModelInfo
                                        ?.data
                                        ?.attributes
                                        ?.fullName?[0] ??
                                    "U",
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w400)),
                      ),
                      CustomText(
                          text: personalInfoController.userDetailsModelInfo
                                  ?.data?.attributes?.fullName ??
                              "User",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          top: 16.h,
                          bottom: 24.h),
                      Divider(height: 1.h, color: AppColors.white50),
                      InkWell(
                          onTap: () => Get.toNamed(AppRoute.profileInfo),
                          child: ProfileScreenItem(
                            icon: AppIcons.profile,
                            title: "Personal info".tr,
                          )),
                      InkWell(
                          onTap: () => Get.toNamed(AppRoute.securityScreen),
                          child: ProfileScreenItem(
                            icon: AppIcons.security,
                            title: "Security".tr,
                          )),
                      InkWell(
                          onTap: () => Get.toNamed(AppRoute.languageScreen),
                          child: ProfileScreenItem(
                            icon: AppIcons.language,
                            title: "Language".tr,
                          )),
                      InkWell(
                          onTap: () => Get.toNamed(AppRoute.legalScreen),
                          child: ProfileScreenItem(
                            icon: AppIcons.legal,
                            title: "LegalProfile".tr,
                          )),
                      SizedBox(height: 42.h),
                    ],
                  ),
                ),
              )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: GestureDetector(
            onTap: () => Get.toNamed(AppRoute.contactSupport),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.support, size: 30.h),
                CustomText(
                    text: "Contact support".tr,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                    left: 8.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
