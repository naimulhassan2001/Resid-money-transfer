import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/text/custom_text.dart';


class MoneyDeliveryResume extends StatelessWidget {
  const MoneyDeliveryResume({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
          child: Center(
            child: CustomText(text: "The transfers to this country will resume soon".tr,fontSize: 26.sp,maxLines: 3),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
          child: CustomButton(titleText: "Back to main menu".tr,buttonRadius: 25.r, onPressed: (){
            Get.offAllNamed(AppRoute.transaction);
          }),
        ),
      ),
    );
  }
}
