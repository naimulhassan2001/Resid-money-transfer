import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/amoun_send_controller.dart';
import '../../../controller/enter_passcode_controller.dart';
import '../../../controller/transaction_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../helper/shared_preference_helper.dart';
import '../../../services/socket_services.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';


class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TransactionController transactionController =
      Get.put(TransactionController());

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  EnterPasscodeController enterPasscodeController =
      Get.put(EnterPasscodeController());

  SocketServices socketServices = SocketServices();
  AmountSendController amountSendController = Get.put(AmountSendController());

  @override
  void initState() {
    sharedPreferenceHelper.getSharedPreferenceData();
    socketServices.connectToSocket();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.notification),
                  child: CustomImage(imageSrc: AppIcons.bell, size: 24.h, imageColor: AppColors.white100,)),
              GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.profile),
                  child: CustomImage(imageSrc: AppIcons.profile, size: 24.h,imageColor: AppColors.white100,)),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: "Recent transaction".tr, fontSize: 26.sp),

              ///<=================================== user Cancel ================================================ >

              // Obx(() => AmountSendController.isCancelled.value
              //     ? Container(
              //         height: 120,
              //         width: double.infinity,
              //         margin: EdgeInsets.only(top: 16.h),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //               color: AppColors.primaryColor,
              //               width: 1.w,
              //               style: BorderStyle.solid),
              //           borderRadius: BorderRadius.circular(10.r),
              //           color: AppColors.white50,
              //         ),
              //         child: Padding(
              //           padding: EdgeInsets.symmetric(
              //               horizontal: 12.w, vertical: 8.h),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               CustomText(
              //                 text: "Cancelled Transaction".tr,
              //                 fontSize: 16.sp,
              //               ),
              //               Row(
              //                 children: [
              //                   SvgPicture.network(
              //                     AmountSendController.countryFlag.value,
              //                     height: 24.sp,
              //                     width: 24.sp,
              //                   ),
              //                   SizedBox(
              //                     width: 8.w,
              //                   ),
              //                   CustomText(
              //                     text: AmountSendController.countryName.value,
              //                     color: AppColors.black50,
              //                   )
              //                 ],
              //               ),
              //               SizedBox(
              //                 height: 10.h,
              //               ),
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   CustomText(
              //                     text: amountSendController.isRepeat.value
              //                         ? "${"To Mobile".tr} ${AmountSendController.numberController.text}"
              //                         : "${"To Mobile".tr} ${AmountSendController.countryCode.value}${AmountSendController.numberController.text}",
              //                     color: AppColors.black50,
              //                     maxLines: 1,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   CustomText(
              //                     text: transactionController.currentDate(),
              //                     color: AppColors.black50,
              //                   )
              //                 ],
              //               )
              //             ],
              //           ),
              //         ),
              //       )
              //     : const SizedBox()),

              ///<=================================== user Cancel ================================================ >

              CustomText(
                text: transactionController.formattedDate(),
                // Use the formatted date here
                fontSize: 16.sp,
                color: AppColors.white50,
                top: 16.h,
                bottom: 12.h,
              ),
              Expanded(
                child: Obx(() => transactionController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Obx(() => transactionController.transactionList.isEmpty
                        ? Column(
                            children: [
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomText(
                                text: "You have no recent transaction".tr,
                                maxLines: 2,
                                fontSize: 20.sp,
                                color: AppColors.white50,
                              ),
                            ],
                          )
                        : ListView.builder(
                            controller: transactionController.scrollController,
                            itemCount: transactionController.isMoreLoading.value
                                ? transactionController.transactionList.length +
                                    1
                                : transactionController.transactionList.length,
                            itemBuilder: (context, index) {
                              if (index <
                                  transactionController
                                      .transactionList.length) {
                                var transactionModel = transactionController
                                    .transactionList[index];

                                return Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: InkWell(
                                    onTap: () {
                                      if (transactionModel.userConfirmation) {
                                        transactionController
                                            .transactionDetailsRepo(
                                                SharedPreferenceHelper
                                                    .accessToken,
                                                transactionModel.sId);
                                      } else {
                                        AmountSendController.transactionID
                                            .value = transactionModel.sId;
                                        AmountSendController
                                                .firstNameController.text =
                                            transactionModel.firstName
                                                .toString();
                                        AmountSendController
                                                .lastNameController.text =
                                            transactionModel.lastName
                                                .toString();
                                        AmountSendController
                                                .numberController.text =
                                            transactionModel.phoneNumber
                                                .toString();
                                        AmountSendController
                                                .amountController.text =
                                            transactionModel.amountToSent
                                                .toString();
                                        AmountSendController
                                                .receiveController.text =
                                            transactionModel.amountToReceive
                                                .toString();
                                        amountSendController.isTimer.value =
                                            false;
                                        amountSendController
                                            .isConfirmation.value = true;
                                        amountSendController.confirmTimer(
                                            transactionController
                                                    .transactionList[index]
                                                    .createdAt ??
                                                "00:00:00.0000");

                                        print(
                                            "========================>transactionID ${AmountSendController.transactionID.value}");

                                        Get.toNamed(
                                            AppRoute.paymentMethodFinal);

                                        // amountSendController.confirmTransactionRepo(transactionModel.s)
                                      }
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 50.h,
                                                width: 50.w,
                                                padding: EdgeInsets.all(4.h),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1.w,
                                                        style:
                                                            BorderStyle.solid),
                                                    shape: BoxShape.circle,
                                                    color: AppColors.gray20),
                                                child: const CustomImage(
                                                    imageSrc: AppIcons.arrow),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 15.h,
                                                  width: 15.w,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: SvgPicture.network(
                                                    "${transactionModel.country?.countryFlag}",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  decoration: BoxDecoration(
                                                    color: transactionModel
                                                            .userConfirmation
                                                        ? AppColors
                                                            .transparentColor
                                                        : AppColors.white
                                                            .withOpacity(0.5),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 15.h,
                                                  width: 15.w,
                                                  decoration: BoxDecoration(
                                                    color: transactionModel
                                                            .userConfirmation
                                                        ? AppColors
                                                            .transparentColor
                                                        : AppColors.white
                                                            .withOpacity(0.5),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.w),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                        child: CustomText(
                                                            text:
                                                                "${transactionModel.firstName} ${transactionModel.lastName}",
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            right: 24.h,
                                                            color: transactionModel
                                                                    .userConfirmation
                                                                ? AppColors
                                                                    .white100
                                                                : AppColors
                                                                    .white100
                                                                    .withOpacity(
                                                                        0.5),
                                                            textAlign: TextAlign
                                                                .start)),
                                                    Text(
                                                      "${transactionModel.amountToReceive} ${"XAF".tr}",
                                                      style: TextStyle(
                                                          fontSize: 18.sp,
                                                          color: transactionModel
                                                                  .userConfirmation
                                                              ? AppColors
                                                                  .white100
                                                              : AppColors
                                                                  .white100
                                                                  .withOpacity(
                                                                      0.5),
                                                          decoration:
                                                              transactionModel
                                                                          .status ==
                                                                      "cancelled"
                                                                  ? TextDecoration
                                                                      .lineThrough
                                                                  : TextDecoration
                                                                      .none,
                                                          decorationThickness:
                                                              3,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CustomText(
                                                        text:
                                                            "${"To Mobile".tr} ",
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: transactionModel
                                                                .userConfirmation
                                                            ? AppColors.white100
                                                                .withOpacity(
                                                                    0.5)
                                                            : AppColors.white100
                                                                .withOpacity(
                                                                    0.3),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start),
                                                    Flexible(
                                                      child: CustomText(
                                                          text:
                                                              "${transactionModel.phoneNumber}",
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 1,
                                                          color: transactionModel
                                                                  .userConfirmation
                                                              ? AppColors
                                                                  .white100
                                                                  .withOpacity(
                                                                      0.5)
                                                              : AppColors
                                                                  .white100
                                                                  .withOpacity(
                                                                      0.3),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.start),
                                                    ),
                                                    transactionModel
                                                            .userConfirmation
                                                        ? transactionModel
                                                                    .status ==
                                                                "pending"
                                                            ? CustomImage(
                                                                imageType:
                                                                    ImageType
                                                                        .png,
                                                                imageSrc: AppIcons
                                                                    .loadingIcon,
                                                                size: 20.h,
                                                                imageColor: transactionModel
                                                                        .userConfirmation
                                                                    ? AppColors
                                                                        .white100
                                                                    : AppColors
                                                                        .white100
                                                                        .withOpacity(
                                                                            0.5),
                                                              )
                                                            : transactionModel
                                                                        .status ==
                                                                    "cancelled"
                                                                ? CustomImage(
                                                                    imageSrc:
                                                                        AppIcons
                                                                            .cancelled,
                                                                    size: 20.h,
                                                                    imageColor: transactionModel.userConfirmation
                                                                        ? AppColors
                                                                            .white100
                                                                        : AppColors
                                                                            .white100
                                                                            .withOpacity(0.5),
                                                                  )
                                                                : transactionModel
                                                                            .status ==
                                                                        "transferred"
                                                                    ? CustomImage(
                                                                        imageSrc: AppIcons
                                                                            .success,
                                                                        size: 20
                                                                            .h,
                                                                        imageColor: AppColors
                                                                            .white100)
                                                                    : CustomImage(
                                                                        imageSrc:
                                                                            AppIcons
                                                                                .transferred,
                                                                        imageType:
                                                                            ImageType
                                                                                .png,
                                                                        size: 20
                                                                            .h,
                                                                        imageColor:
                                                                            AppColors.white100)
                                                        : const Icon(
                                                            Icons
                                                                .privacy_tip_outlined,
                                                            color: AppColors
                                                                .white50,
                                                          ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ))),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 24.h, left: 20.w, right: 20.w),
          child: CustomButton(
              titleText: "Send".tr,
              buttonRadius: 10.r,
              onPressed: () {
                Get.toNamed(AppRoute.selectCountry) ;

                // amountSendController.isConfirmation.value = false;
                // amountSendController.timer?.cancel();
                // amountSendController.time.value = "0:10:00.00000";
                // AmountSendController.isCancelled.value = false;
                // amountSendController.isRepeat.value = false;
                // AmountSendController.numberController.clear();
                // AmountSendController.amountController.clear();
                // AmountSendController.receiveController.clear();
                // AmountSendController.firstNameController.clear();
                // AmountSendController.lastNameController.clear();
                // Get.toNamed(AppRoute.selectCountry);


              }),
        ),
      ),
    );
  }
}
