import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resid_money_transfer/view/screen/recipient/widget/appbar_rich_text.dart';
import 'package:resid_money_transfer/view/screen/recipient/widget/payment_information.dart';
import 'package:resid_money_transfer/view/screen/recipient/widget/rich_text.dart';


import '../../../controller/amoun_send_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/image/custom_image.dart';

class PaymentMethodFinal extends StatefulWidget {
  PaymentMethodFinal({super.key});

  @override
  State<PaymentMethodFinal> createState() => _PaymentMethodFinalState();
}

class _PaymentMethodFinalState extends State<PaymentMethodFinal> {
  AmountSendController amountSendController = Get.put(AmountSendController());

  @override
  void initState() {
    amountSendController.paymentInfoRepo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        "=======================================> ${AmountSendController.transactionID.value}");
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: PaymentTextRich(
          firstText: "Transfer of ".tr,
          secondText:
              "${AmountSendController.receiveController.text} ${amountSendController.amountToReceiveCurrency}",
          thirdText: "to".tr,
          fourText:
              "${AmountSendController.firstNameController.text} ${AmountSendController.lastNameController.text}",
          fontSize: 20.sp,
        ),
        actions: [
          SizedBox(
            width: 60.w,
          )
        ],
        centerTitle: true,
        leadingWidth: 55.w,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            margin: EdgeInsets.only(left: 20.w),
            decoration: const BoxDecoration(
                color: AppColors.white100, shape: BoxShape.circle),
            child: const CustomImage(
              imageSrc: AppIcons.arrowBackIos,
              size: 18,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
            child: Obx(
          () => amountSendController.isLoadingFinalScreen.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : amountSendController.paymentInfoModelInfo == null
                  ? SizedBox()
                  : Column(
                      children: [
                        PaymentTextRich(
                          firstText:
                              "To make the payment you should log in your bank app (sberbank online) and send"
                                  .tr,
                          secondText:
                              "${AmountSendController.amountController.text} ${amountSendController.amountToSentCurrency}",
                          thirdText:
                              " to the phone number displayed below. After sending the money, click on "
                                  .tr,
                          fourText: "I made the payment".tr,
                          maxLines: 10,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          child: PaymentInformation(),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        RichTextWidget(
                          firstText: "You have ".tr,
                          secondColor: AppColors.redDark,
                          secondText: amountSendController.formattedDuration(),
                          thirdText: " left to make the payment".tr,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomButton(
                            titleText: "I made the payment".tr,
                            buttonRadius: 20.r,
                            titleColor: AppColors.white85,
                            buttonWidth: double.infinity,
                            titleSize: 20.sp,
                            onPressed: () {
                              if (amountSendController.disableButton.value) {
                                Utils.toastMessage(
                                    "payment time out, please try again".tr);
                              } else {
                                amountSendController.confirmTransactionRepo();
                              }
                              // Get.toNamed(AppRoute.transactionSuccessScreen);
                            })
                      ],
                    ),
        )),
      ),
    );
  }
}
