import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../models/notification_model.dart';
import '../services/api_services/api_services.dart';

class NotificationController extends GetxController {
  NotificationModel? notificationModelInfo;

  RxList notificationList = [].obs;

  RxBool isMoreLoading = false.obs;
  RxBool loading = false.obs;

  int page = 1;

  ScrollController scrollController = ScrollController();

  NetworkApiService networkApiService = NetworkApiService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  // void onInit() {
  //   notificationRepo();
  //   scrollController.addListener(() {
  //     scrollControllerCall();
  //   });
  //   super.onInit();
  // }

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await notificationRepo();
    } else {
    }
  }

  Future<void> notificationRepo() async {

    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}"
    };

    isMoreLoading.value = true;
    if (notificationList.isEmpty) {
      loading.value = true;
    }

    networkApiService
        .getApi(
      "${ApiUrl.notification}?page=$page",
      header,
    )
        .then((apiResponseModel) {
      isMoreLoading.value = false;
      loading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        notificationModelInfo = NotificationModel.fromJson(json);
        for (var item
            in notificationModelInfo!.data!.attributes!.notificationList!) {
          notificationList.add(item);
        }
        page = page + 1;
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  String getFormattedDate(String dateString) {
    // String dateString = "2024-02-01T04:39:03.524Z";
    DateTime originalDateTime = DateTime.parse(dateString);
    DateTime currentDateTime = DateTime.now();

    Duration difference = currentDateTime.difference(originalDateTime);
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return ("${difference.inMinutes} minutes ago");
      } else {
        return ("${difference.inHours} hours ago");
      }
      return ("${difference.inHours % 24} ${"hours".tr} ${difference.inMinutes % 60} ${"minutes".tr}");
    } else {
      var createdAtTime = dateString.split(".")[0];
      var date = createdAtTime.split("T")[0];
      var time = createdAtTime.split("T")[1];
      return "${date} at $time";
    }
  }
}
