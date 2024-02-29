import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../models/transaction_details_model.dart';
import '../models/transaction_model.dart';
import '../services/api_services/api_services.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  TransactionModel? transactionModelInfo;

  TransactionDetailsModel? transactionDetailsModelInfo;
  RxList transactionList = [].obs;

  RxBool isMoreLoading = false.obs;
  RxBool loading = false.obs;
  int page = 1;

  ScrollController scrollController = ScrollController();

  NetworkApiService networkApiService = NetworkApiService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  // @override
  // void onInit() {
  //   transactionRepo();
  //   scrollController.addListener(() {
  //     scrollControllerCall();
  //   });
  //   super.onInit();
  // }

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      await transactionRepo();
    } else {
    }
  }

  Future<void> transactionRepo() async {

    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}"
    };

    isMoreLoading.value = true;
    if (transactionList.isEmpty) {
      loading.value = true;
    }

    networkApiService
        .getApi("${ApiUrl.transaction}?page=$page", header)
        .then((apiResponseModel) {
      isMoreLoading.value = false;
      loading.value = false;


      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        transactionModelInfo = TransactionModel.fromJson(json);

        for (var item
            in transactionModelInfo!.data!.attributes!.transactionList!) {
          transactionList.add(item);
        }

        page = page + 1;
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> transactionDetailsRepo(String token, String id) async {

    transactionDetailsModelInfo = null;
    Get.toNamed(AppRoute.transactionHistory);

    Map<String, String> header = {'Authorization': "Bearer $token"};

    isMoreLoading.value = true;

    networkApiService
        .getApi("${ApiUrl.transaction}/$id", header)
        .then((apiResponseModel) {
      isMoreLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        transactionDetailsModelInfo = TransactionDetailsModel.fromJson(json);
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);
        transactionDetailsModelInfo = TransactionDetailsModel.fromJson(json);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  String formattedDate() {
    DateTime currentTime = DateTime.now();
    // Assuming transactionController.currentTime is a DateTime object
    DateTime originalDate = currentTime;
    return DateFormat.yMMMMd().format(originalDate);
  }

  String currentDate() {
    final now = DateTime.now();
    String formatter = DateFormat('d.MM.yy').format(now); // 28/03/2020
    return formatter.toString();
  }

  String historyScreenDateFormat(String date) {

    List<String> dateParts = date.split('-');

    int year = int.parse(dateParts[0]);

    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    final dateFormat = DateFormat('d MMMM, yyyy', 'en');
    final currentDate =
        DateTime(year, month, day); // Replace with your actual date
    return dateFormat.format(currentDate);
  }

  // String formattedDuration(String time) {
  //
  //   // Parse the duration string
  //   List<String> parts = time.split(':');
  //   Duration duration = Duration(
  //     hours: int.parse(parts[0]),
  //     minutes: int.parse(parts[1]),
  //     seconds: int.parse(
  //         parts[2].split('.')[0]), // Extract seconds without milliseconds
  //   );
  //
  //   // Format the duration as needed
  //   String formattedDuration =
  //       "${duration.inHours}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}";
  //
  //   return formattedDuration;
  // }

  String formattedDuration(String time, String date) {


    List<String> dateParts = date.split('-');

    int year = int.parse(dateParts[0]);

    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);

    // Parse the duration string
    List<String> parts = time.split(':');
    Duration duration = Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(
        parts[2].split('.')[0], // Extract seconds without milliseconds
      ),
    );

    final utcTime = DateTime.utc(year, month, day,duration.inHours%60 ,duration.inMinutes%60 ,duration.inSeconds%60);
    final localTime = utcTime.toLocal();

    // Format the duration as needed with AM/PM
    String period = localTime.hour >= 12 ? 'PM' : 'AM';
    int formattedHours = localTime.hour % 12 == 0 ? 12 : localTime.hour % 12;
    String formattedDuration =
        "$formattedHours:${(localTime.minute).toString().padLeft(2, '0')} $period";

    return formattedDuration;
  }
}
