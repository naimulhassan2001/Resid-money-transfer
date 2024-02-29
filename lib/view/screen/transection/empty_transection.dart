import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';


class EmptyTransaction extends StatelessWidget {
  const EmptyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(onTap: () => Get.toNamed(AppRoute.notification),child: CustomImage(imageSrc: AppIcons.bell, size: 24.h)),
              GestureDetector(onTap: () => Get.toNamed(AppRoute.profile),child: CustomImage(imageSrc: AppIcons.profile,size: 24.h)),
            ],
          ),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Recent transaction".tr,fontSize: 26.sp),
                CustomText(text: "You have no recent transaction".tr,fontSize: 20.sp,color: AppColors.white50,top: 12.h,maxLines: 2),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: CustomButton(titleText: "Send".tr,buttonRadius: 25.r,onPressed: () => Get.toNamed(AppRoute.transaction),),
        ),
      ),
    );
  }
}
