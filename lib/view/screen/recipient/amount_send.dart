import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/amoun_send_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/text/custom_text.dart';
import 'bottom_sheet/make_payment.dart';
import 'widget/custom_keyboard.dart';

class AmountSendScreen extends StatelessWidget {
  AmountSendScreen({super.key});

  MakePayment makePayment = MakePayment();

  AmountSendController amountSendController = Get.put(AmountSendController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "You pay".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: "Recipient gets".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white75,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      cursorColor: Colors.transparent,
                      showCursor: false,
                      onTap: () => amountSendController.isPay.value = true,
                      keyboardType: TextInputType.none,
                      textAlign: TextAlign.center,

                      controller: AmountSendController.amountController,
                      validator: (value) {
                        if (double.parse(value!) > 150000) {
                          return "maximum amount 150000 RUB".tr;
                        }

                        if (double.parse(value) < 100) {
                          return "minimum amount 100 RUB".tr;
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "0",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                            fontSize: 32.sp,
                            color: AppColors.primaryColor,
                          )),
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      onTap: () => amountSendController.isPay.value = false,
                      keyboardType: TextInputType.none,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.transparent,
                      controller: AmountSendController.receiveController,
                      decoration: InputDecoration(
                          hintText: "0",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                            fontSize: 32.sp,
                            color: AppColors.white100,
                          )),
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: AppColors.white100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CustomText(
                      text: "RUB".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: "XAF".tr,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white75,
                    ),
                  )
                ],
              ),
              const Spacer(),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: "Fee".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white50,
                  ),
                  CustomText(
                    text: "0 RUB",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white100,
                  )
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: "Should arrive".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white50,
                  ),
                  CustomText(
                    text: "In a few minutes".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white100,
                  )
                ],
              ),
              const Divider(),
              Obx(() => amountSendCustomKeyboard(
                  controller: amountSendController.isPay.value
                      ? AmountSendController.amountController
                      : AmountSendController.receiveController,
                  onTap: amountSendController.isPay.value
                      ? amountSendController.youPay
                      : amountSendController.receiveAmount,
                  isPoint: true)),

              // amountSendCustomKeyboard(
              //       isPoint: true, amountSendController.amountController
              //          ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      makePayment.makePaymentSheet(context);
                    }
                  },
                  titleText: 'Continue'.tr,
                  titleSize: 14.sp,
                  buttonWidth: 155.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
