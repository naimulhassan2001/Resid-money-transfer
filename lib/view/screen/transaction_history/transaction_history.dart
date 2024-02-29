import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../controller/amoun_send_controller.dart';
import '../../../controller/transaction_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../helper/date_time_converter.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/row_text/row_text.dart';
import '../../widgets/text/custom_text.dart';

class TransactionHistory extends StatelessWidget {
  TransactionHistory({super.key});

  AmountSendController amountSendController = Get.put(AmountSendController());

  TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: Obx(() => transactionController.isMoreLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : transactionController.transactionDetailsModelInfo == null
                ? const Center(
                    child: Text("No Data found"),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 24.h),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 75.h,
                                width: 75.w,
                                padding: EdgeInsets.all(4.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 1.w,
                                        style: BorderStyle.solid),
                                    shape: BoxShape.circle,
                                    color: AppColors.gray20),
                                child:
                                    const CustomImage(imageSrc: AppIcons.arrow),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 24.h,
                                  width: 24.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.network(
                                      "${transactionController.transactionDetailsModelInfo?.data?.attributes?.country?.countryFlag}"),
                                ),
                              ),
                            ],
                          ),
                          CustomText(
                              text:
                                  "${transactionController.transactionDetailsModelInfo?.data?.attributes?.sender?.fullName?.toUpperCase()}",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                              top: 8.h,
                              bottom: 8.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text:
                                      "${transactionController.transactionDetailsModelInfo?.data?.attributes?.amountToSent} ${transactionController.transactionDetailsModelInfo?.data?.attributes?.ammountToSentCurrency}",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  right: 4.w),
                              Icon(Icons.arrow_forward_outlined,
                                  size: 18.h, color: AppColors.white100),
                              CustomText(
                                  text:
                                      "${transactionController.transactionDetailsModelInfo?.data?.attributes?.amountToReceive} ${"XAF".tr}",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  left: 4.w),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: transactionController
                                              .transactionDetailsModelInfo!
                                              .data!
                                              .attributes!
                                              .status ==
                                          "pending"
                                      ? CustomImage(
                                          imageType: ImageType.png,
                                          imageSrc: AppIcons.loadingIcon,
                                          size: 20.h,
                                          imageColor: AppColors.white100)
                                      : transactionController
                                                  .transactionDetailsModelInfo!
                                                  .data!
                                                  .attributes!
                                                  .status ==
                                              "cancelled"
                                          ? CustomImage(
                                              imageSrc: AppIcons.cancelled,
                                              size: 20.h,
                                              imageColor: AppColors.white100)
                                          : transactionController
                                                      .transactionDetailsModelInfo!
                                                      .data!
                                                      .attributes!
                                                      .status ==
                                                  "transferred"
                                              ? CustomImage(
                                                  imageSrc: AppIcons.success,
                                                  size: 20.h,
                                                  imageColor:
                                                      AppColors.white100)
                                              : CustomImage(
                                                  imageSrc:
                                                      AppIcons.transferred,
                                                  imageType: ImageType.png,
                                                  size: 20.h,
                                                  imageColor:
                                                      AppColors.white100)),
                              SizedBox(
                                width: 4.w,
                              ),
                              CustomText(
                                  text:
                                      "${transactionController.transactionDetailsModelInfo?.data?.attributes?.status}"
                                          .tr,
                                  fontSize: 18.sp,
                                  left: 4.w)
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Obx(() => amountSendController.hiddenFeeLoading.value
                              ? Column(
                                  children: [
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    SizedBox(height: 12.h),
                                  ],
                                )
                              : const SizedBox()),
                          Divider(height: 1.h, color: AppColors.white50),
                          SizedBox(height: 12.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 35.h,
                                width: 35.h,
                                margin:
                                    EdgeInsets.only(left: 20.w, right: 12.w),
                                padding: EdgeInsets.all(8.h),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor),
                                child:
                                    const CustomImage(imageSrc: AppIcons.reTry),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    AmountSendController.isCancelled.value =
                                        false;
                                    amountSendController.isRepeat.value = true;
                                    AmountSendController.amountController.text =
                                        "";

                                    AmountSendController
                                            .firstNameController.text =
                                        transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .firstName!;
                                    AmountSendController
                                            .lastNameController.text =
                                        transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .lastName!;
                                    AmountSendController.numberController.text =
                                        transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .phoneNumber!;
                                    amountSendController.countryId.value =
                                        transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .country!
                                            .sId!;
                                    amountSendController.paymentMethod.value =
                                        transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .paymentMethod!;

                                    amountSendController.hiddenFeeRepo(
                                        isRepeated: true,
                                        amount: transactionController
                                            .transactionDetailsModelInfo!
                                            .data!
                                            .attributes!
                                            .amountToSent
                                            .toString());
                                  },
                                  child: CustomText(
                                      text: "Repeat transfer".tr,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor))
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Divider(height: 1.h, color: AppColors.white50),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: CustomText(
                                          text: "Transaction ID".tr,
                                          color: AppColors.white50,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                            text: transactionController
                                                .transactionDetailsModelInfo!
                                                .data!
                                                .attributes!
                                                .transactionId!
                                                .split("#")[1]
                                                .toString(),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w400,
                                            right: 4.w),
                                        IconButton(
                                          onPressed: () {
                                            final value = ClipboardData(
                                                text: transactionController
                                                    .transactionDetailsModelInfo!
                                                    .data!
                                                    .attributes!
                                                    .transactionId
                                                    .toString());
                                            Clipboard.setData(value);
                                            Utils.snackBarMessage("Copy",
                                                "Transaction ID copied to clipboard");
                                          },
                                          icon: Icon(Icons.copy_rounded,
                                              size: 18.h,
                                              color: AppColors.white50),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                // RowText(
                                //     title: "Date".tr,
                                //     value:
                                //         "${transactionController.historyScreenDateFormat(transactionController.transactionDetailsModelInfo?.data?.attributes?.createdAt?.split("T")[0].toString() ?? "2023-01-01")} AT ${transactionController.formattedDuration(transactionController.transactionDetailsModelInfo?.data?.attributes?.createdAt?.split("T")[1].toString() ?? "00:00:00.0000", transactionController.transactionDetailsModelInfo?.data?.attributes?.createdAt?.split("T")[0].toString() ?? "2023-01-01")}"
                                //
                                //     // value: transactionController
                                //     //     .transactionDetailsModelInfo!
                                //     //     .data!
                                //     //     .attributes!
                                //     //     .createdAt!
                                //     //     .split(".")[0]
                                //     //     .toString()
                                //     ),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text:"Date".tr,color: AppColors.white50,fontSize: 18.sp,fontWeight: FontWeight.w400,right: 24.w),
                                    Flexible(child: CustomText(text:DateTimeConverter.convertUtcToLocal(transactionController.transactionDetailsModelInfo?.data?.attributes!.createdAt),fontSize: 18.sp,fontWeight: FontWeight.w400,right: 4.w,maxLines: 2)),
                                  ],
                                ),


                                SizedBox(height: 24.h),
                                RowText(
                                    title: "Rate".tr,
                                    value:
                                        "${transactionController.transactionDetailsModelInfo!.data!.attributes!.exchangeRate}"),
                                SizedBox(height: 24.h),
                                RowText(title: "Fee".tr, value: "0 RUB"),
                                SizedBox(height: 24.h),
                                RowText(
                                    title: "Recipient".tr,
                                    value:
                                        "${transactionController.transactionDetailsModelInfo!.data!.attributes!.firstName} ${transactionController.transactionDetailsModelInfo!.data!.attributes!.lastName}"),
                                SizedBox(height: 24.h),
                                RowText(
                                    title: "Delivery".tr,
                                    value:
                                        "${"To Mobile".tr} ${transactionController.transactionDetailsModelInfo!.data!.attributes!.phoneNumber}"),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Divider(height: 1.h, color: AppColors.white50),
                          SizedBox(height: 12.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.contactSupport),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomImage(
                                      imageSrc: AppIcons.support, size: 35.h),
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
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }
}
