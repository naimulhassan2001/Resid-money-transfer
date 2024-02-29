import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/custom_text_field/custom_text_field.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class EditEmailScreen extends StatelessWidget {
  const EditEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Enter your new email".tr,
              fontSize: 20.sp,
              maxLines: 2,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
                text: "Email".tr,
                fontSize: 14.sp,
                style: true,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                top: 27.h),
            SizedBox(
              height: 4.h,
            ),
            CustomTextField(
              fillColor: AppColors.gray80,
              hintText: "Enter your new email".tr,
              suffixIcon: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: CustomImage(
                    imageSrc: AppIcons.mail,
                    imageType: ImageType.svg,
                    size: 24.h,
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
                titleText: "Save".tr,
                buttonRadius: 50.r,
                buttonWidth: 150.w,
                onPressed: () {
                  Get.toNamed(AppRoute.changeEmailVerify);
                }),
          ],
        ),
      ),
    );
  }
}
