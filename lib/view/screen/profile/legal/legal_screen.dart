import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/legal_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/text/custom_text.dart';


class LegalScreen extends StatelessWidget {
  LegalScreen({super.key});

  LegalController legalController = Get.put(LegalController());

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Obx(() =>  Center(
               child: legalController.isLoading.value
                   ? const CircularProgressIndicator()
                   : const SizedBox(),
             ),),
              CustomText(
                text: "Legal".tr,
                fontSize: 24.sp,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                  onTap: () => legalController.termsOfServiceRepo(),
                  child: CustomText(
                    text: "Terms of Services".tr,
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    color: AppColors.primaryColor,
                  )),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                  onTap: () => legalController.termsOfMoneyTransferRepo(),
                  child: CustomText(
                    text: "Terms of money transfer".tr,
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    color: AppColors.primaryColor,
                  )),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                  onTap: () => legalController.personDataPolicyRepo(),
                  child: CustomText(
                    text: "Personal Data Policy".tr,
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,

                    color: AppColors.primaryColor,
                  )),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                  onTap: () =>
                      legalController.refundAndCancellationPolicyRepo(),
                  child: CustomText(
                    text: "Refund and Cancellation Policy".tr,
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    color: AppColors.primaryColor,
                  )),
              SizedBox(
                height: 24.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
