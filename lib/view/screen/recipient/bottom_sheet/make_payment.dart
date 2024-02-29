import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:resid_money_transfer/core/app_route/app_route.dart';


import '../../../../controller/amoun_send_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/text/custom_text.dart';
import '../widget/rich_text.dart';

class MakePayment {
  makePaymentSheet(BuildContext context) {

    AmountSendController amountSendController = Get.put(AmountSendController()) ;

    return showModalBottomSheet(
      backgroundColor: AppColors.background,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: "Important".tr,
                      fontSize: 20.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppIcons.cancel,
                          color: AppColors.white100,
                          height: 16.h,
                          width: 16.w,
                        ))
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomText(
                  text: "1-You can make the payment from any russian bank".tr,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichTextWidget(
                    firstText: "2-You will get ".tr,
                    secondText: "10 minutes".tr,
                    thirdText: " to make the payment".tr),
                SizedBox(
                  height: 16.h,
                ),
                RichTextWidget(
                    firstText: "3-If after ".tr,
                    secondText: "10 minutes".tr,
                    thirdText:
                        " the payment has not been made, the transaction will be automatically canceled"
                            .tr),
                SizedBox(
                  height: 16.h,
                ),
                Center(
                  child: CustomButton(
                      titleText: "Make payment".tr,
                      buttonHeight: 50.h,
                      titleSize: 20.sp,
                      buttonWidth: double.infinity,
                      onPressed: () {

                        Get.toNamed(AppRoute.transactionCancelScreen) ;
                        // amountSendController.addTransactionRepo();
                        // amountSendController.isTimer.value = true ;
                        // amountSendController.paymentInfoRepo() ;
                        // Get.toNamed(AppRoute.paymentMethodFinal);
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
