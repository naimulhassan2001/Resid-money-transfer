import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/amoun_send_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/text/custom_text.dart';


class MoneyDeliveryMethod extends StatelessWidget {
  MoneyDeliveryMethod({super.key});

  AmountSendController amountSendController = Get.put(AmountSendController());

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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "Select how to deliver money to recipient".tr,
                    fontSize: 22.sp,
                    bottom: 24.h,
                    maxLines: 4,
                  ),
                  Obx(() => amountSendController.hiddenFeeLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox()),
                  GestureDetector(
                    onTap: () {

                      Get.toNamed(AppRoute.recipient);

                      //
                      // amountSendController.paymentMethod.value =
                      //     "Mobile Money CEMAC";
                      //
                      // amountSendController.hiddenFeeRepo();

                    },
                    child: Container(
                      height: 220.sp,
                      width: 330.sp,
                   //  child:SvgPicture.asset(AppImages.cemac),
                      child: Image.asset(
                        AppImages.cemac,
                        height: 220.sp,
                        width: 330.sp,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Should arrive in".tr, fontSize: 14.sp,),
                      Flexible(
                        child: CustomText(
                            text: " a few minutes".tr,
                            fontSize: 14.sp,
                            color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                          text: "0 %", color: AppColors.primaryColor),
                      CustomText(text: " Fee".tr),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
