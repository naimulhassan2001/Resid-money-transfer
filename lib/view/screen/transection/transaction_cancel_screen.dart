import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/amoun_send_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/rich_text/rich_text.dart';
import '../../widgets/text/custom_text.dart';
import 'widget/cancel_rich_text.dart';
import 'widget/successful_item.dart';

class TransactionCancelScreen extends StatelessWidget {
  TransactionCancelScreen({super.key});

  AmountSendController amountSendController = Get.put(AmountSendController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xff413B3B),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    AmountSendController.isCancelled.value = true;
                    Get.offAllNamed(AppRoute.transaction);
                    AmountSendController.amountController.clear();
                    AmountSendController.receiveController.clear();
                    AmountSendController.firstNameController.clear();
                    AmountSendController.lastNameController.clear();
                  },
                  child: CustomText(
                    text: "Continue".tr,
                    fontSize: 20,
                    bottom: 12.h,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomImage(imageSrc: AppIcons.cancel),
                    CustomText(
                      text: "Your  order has been cancelled".tr,
                      fontSize: 20,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextRichWidget(
                        firstText:
                            "If you believe your transaction was canceled by mistake, please "
                                .tr,
                        secondText:
                            "${AmountSendController.firstNameController.text} ${AmountSendController.lastNameController.text}"),
                    SizedBox(
                      height: 30.h,
                    ),
                    SuccessfulItem(
                      title: "Amount Sent".tr,
                      service:
                          "${AmountSendController.amountController.text} RUB",
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SuccessfulItem(
                      title: "Fee".tr,
                      service: "0.00 RUB",
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SuccessfulItem(
                        title: "You pay".tr,
                        service:
                            "${AmountSendController.amountController.text} RUB",
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor),
                    SizedBox(
                      height: 12.h,
                    ),
                    SuccessfulItem(
                      title: "Amount Received".tr,
                      service:
                          "${AmountSendController.receiveController.text} ${"XAF".tr}",
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    SuccessfulItem(
                      title: "Should Arrive".tr,
                      service: "Cancelled".tr,
                      color: AppColors.redMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: "Important!".tr,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ],
            ),
            CancelTextRichWidget(
              secondText: "contact us".tr,
              firstText:
                  "If you believe your transaction was canceled by mistake".tr,
              secondColor: AppColors.primaryColor,
              alignment: TextAlign.start,
              firstColor: Colors.white,
              horizontal: 0,
            )
          ],
        ),
      )),
    );
  }
}
