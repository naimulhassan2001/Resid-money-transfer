import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/notification_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/text/custom_text.dart';
import 'inner_widget/list_item.dart';


class Notification extends StatelessWidget {
  Notification({super.key});

  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
        top: false,
        child: Scaffold(
          extendBody: true,
          backgroundColor: AppColors.background,
          appBar: CustomAppBar(
              appBarContent: Back(
            onTap: () => Get.back(),
            text: "Notification".tr,
          )),
          body: Obx(() => notificationController.loading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
                  child: Obx(
                    () => notificationController.notificationList.isEmpty
                        ? Center(
                            child: CustomText(
                              text: "No notifications".tr,
                              maxLines: 2,
                              fontSize: 20.sp,
                              color: AppColors.white50,
                            ),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: notificationController.scrollController,
                            itemCount:
                                notificationController.isMoreLoading.value
                                    ? notificationController
                                            .notificationList.length +
                                        1
                                    : notificationController
                                        .notificationList.length,
                            itemBuilder: (context, index) {
                              if (index <
                                  notificationController
                                      .notificationList.length) {
                                var item = notificationController
                                    .notificationList[index];

                                return ListItem(
                                  title: item.message!,
                                  time:
                                      "${notificationController.getFormattedDate(item.updatedAt)}",
                                  // time: "$date at $time",
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                  ),
                )),
        ));
  }
}
