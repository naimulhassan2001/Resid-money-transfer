import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../models/add_transaction_model.dart';
import '../models/hidden_fee_model.dart';
import '../models/payment_info_model.dart';
import '../services/api_services/api_services.dart';
import '../utils/app_utils.dart';
import '../view/screen/transection/transaction_cancel_screen.dart';

class AmountSendController extends GetxController {
  // RxInt amount = 0.obs;

  AddTransactionModel? addTransactionModel;

  static RxString transactionID = "hhhhhhhhhh".obs;

  static RxDouble xafRate = 655.96.obs;
  static RxDouble rubRate = 97.55.obs;
  static RxBool success = false.obs;
  RxBool isPay = true.obs;
  RxBool isTimer = true.obs;
  RxBool isConfirmation = false.obs;
  RxBool isRepeat = false.obs;
  RxBool hiddenFeeLoading = false.obs;
  static RxDouble exchangeRate = 0.0.obs;

  RxBool disableButton = false.obs;

  static RxString countryName = "".obs;

  static RxString countryFlag = "".obs;

  final duration = const Duration().obs;
  Timer? timer;
  RxString time = "0:10:00.000000".obs;
  RxString paymentMethod = "Orange Money".obs;

  HiddenFeesModel? hiddenFeesModelInfo;
  PaymentInfoModel? paymentInfoModelInfo;

  RxBool isLoading = false.obs;
  static RxBool isCancelled = false.obs;
  String amountToSentCurrency = "RUB";

  String amountToReceiveCurrency = "XAF";

  static RxString countryCode = "+237".obs;
  RxString countryId = "".obs;
  RxBool isLoadingFinalScreen = false.obs;
  RxBool isLoadingFinalScreenButton = false.obs;
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  ///========================> amount Send <=====================

  static TextEditingController amountController = TextEditingController();
  static TextEditingController receiveController = TextEditingController();

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController numberController = TextEditingController();

  Future<void> exchangeRates(bool isRepeated, String amount) async {
    if (success.value) {
      /// <=============================Test Code ==========================>
      // exchangeRate.value = xafRate.value / rubRate.value;
      // if (hiddenFeesModelInfo!.data!.attributes!.isActive!) {
      //   exchangeRate.value =
      //       exchangeRate.value - (exchangeRate.value * 0.15);
      // }

      /// <=============================Test Code ==========================>

      if (isRepeated) {
        Get.toNamed(AppRoute.amountSend);
        youPay(amount, amountController);
      } else {
        Get.toNamed(AppRoute.recipient);
      }
    } else {
      try {
        hiddenFeeLoading.value = true;

        final url = Uri.parse(ApiUrl.exchangeApi);

        var response = await http.get(url);

        hiddenFeeLoading.value = false;

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          var data = jsonData['rates'];
          success.value = jsonData["success"];
          xafRate.value = data["XAF"];
          rubRate.value = data["RUB"];
          exchangeRate.value = xafRate.value / rubRate.value;

          if (hiddenFeesModelInfo!.data!.attributes!.isActive!) {
            exchangeRate.value = exchangeRate.value -
                (exchangeRate.value *
                    (hiddenFeesModelInfo!.data!.attributes!.percentage! / 100));
          }

          if (isRepeated) {
            Get.toNamed(AppRoute.amountSend);
            youPay(amount, amountController);
          } else {
            Get.toNamed(AppRoute.recipient);
          }
        } else if (response.statusCode == 429) {
          Utils.toastMessage("usage_limit_reached");
        } else {}
      } catch (e) {
        print("error $e");
      }
    }
  }

  ///========================> recipient Information <=====================

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> hiddenFeeRepo(
      {bool isRepeated = false, String amount = "0"}) async {
    if (hiddenFeesModelInfo != null) {
      await exchangeRates(isRepeated, amount);
    } else {
      Map<String, String> header = {
        'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}"
      };

      hiddenFeeLoading.value = true;

      networkApiService
          .getApi(ApiUrl.hiddenFee, header)
          .then((apiResponseModel) async {
        hiddenFeeLoading.value = false;

        if (apiResponseModel.statusCode == 200) {
          var json = jsonDecode(apiResponseModel.responseJson);
          hiddenFeesModelInfo = HiddenFeesModel.fromJson(json);
          exchangeRates(isRepeated, amount);
        } else if (apiResponseModel.statusCode == 201) {
          var json = jsonDecode(apiResponseModel.responseJson);
          hiddenFeesModelInfo = HiddenFeesModel.fromJson(json);
          exchangeRates(isRepeated, amount);
        } else {
          Get.snackbar(
              apiResponseModel.statusCode.toString(), apiResponseModel.message);
        }
      });
    }
  }

  ///========================> payment method final Screen <=====================

  //
  // String name = "Cedric william";
  // String receiverName = "ричард манни в";
  //
  // String amount = "12350 XAF ";
  // String amountRub = "1500 RUB";
  // String paymentId = "Сбербанк (sberbank)";
  // String number = "+79050048977";
  Future<void> paymentInfoRepo() async {
    Map<String, String> header = {};

    isLoadingFinalScreen.value = true;

    networkApiService
        .getApi(ApiUrl.paymentInfo, header, isHeader: false)
        .then((apiResponseModel) {
      isLoadingFinalScreen.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        paymentInfoModelInfo = PaymentInfoModel.fromJson(json);

        if (isConfirmation.value) {
        } else {
          timer?.cancel();
          duration.value = const Duration(minutes: 10);
          startTime();
          time.value = "0:10:00.00000";
        }

        Get.toNamed(AppRoute.paymentMethodFinal);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> addTransactionRepo() async {
    ///=========================================> main Code <============================================
    var body = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "phoneNumber": isRepeat.value
          ? numberController.text
          : "$countryCode${numberController.text}",
      "amountToSent": amountController.text,
      "ammountToSentCurrency": amountToSentCurrency,
      "amountToReceive": receiveController.text,
      "amountToReceiveCurrency": amountToReceiveCurrency,
      "exchangeRate":
          "1 Rub = ${exchangeRate.toStringAsPrecision(3).toString()} XAF",
      "hiddenFees": hiddenFeesModelInfo!.data!.attributes!.isActive!
          ? hiddenFeesModelInfo!.data!.attributes!.percentage.toString()
          : "0",
      "paymentMethod": paymentMethod.value,
      "country": "$countryId",
    };

    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}",
      'Cookie': 'i18next=en'
    };

    try {
      var apiResponseModel =
          await networkApiService.postApi(ApiUrl.allTransactions, body, header);

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        addTransactionModel = AddTransactionModel.fromJson(json);
        Get.toNamed(AppRoute.paymentMethodFinal);
        AmountSendController.transactionID.value =
            addTransactionModel?.data?.attributes?.sId ?? "";
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);
        addTransactionModel = AddTransactionModel.fromJson(json);

        Get.toNamed(AppRoute.paymentMethodFinal);
        AmountSendController.transactionID.value =
            addTransactionModel?.data?.attributes?.sId ?? "";
      } else if (apiResponseModel.statusCode == 401) {
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    } catch (error) {
      // Handle any exceptions that might occur during the API call
      print("Error: $error");
      Get.snackbar("Error", "An error occurred during the API call");
    }
  }

  Future<void> confirmTransactionRepo() async {
    Map<String, String> header = {
      'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}",
      'Cookie': 'i18next=en'
    };

    Map<String, String> body = {};

    var apiResponseModel = await networkApiService.patchApi(
        "${ApiUrl.confirmTransaction}/${transactionID.value}", body, header,
        isBody: false);

    if (apiResponseModel.statusCode == 200) {
      Get.offAllNamed(AppRoute.transactionSuccessScreen);
      timer?.cancel();
    } else if (apiResponseModel.statusCode == 201) {
      Get.offAllNamed(AppRoute.transactionSuccessScreen);
      timer?.cancel();
    } else {
      Utils.snackBarMessage(apiResponseModel.statusCode.toString(),
          apiResponseModel.message.toString());
    }
  }

  ///=================================================> Amount Send Keyboard <==========================================

  void youPay(String value, TextEditingController textController) {
    if (value == 'Forgot') {
      Get.toNamed(AppRoute.resetPasscode);
    } else if (value == '<') {
      if (textController.text.isNotEmpty) {
        textController.text =
            textController.text.substring(0, textController.text.length - 1);
        if (textController.text.isNotEmpty) {
          var amount = double.parse(textController.text);
          var rate = xafRate.value / rubRate.value;
          var receiveAmount = (rate * amount).round();
          receiveController.text = receiveAmount.toString();
        } else {
          receiveController.text = "";
        }
      } else {
        receiveController.text = "";
      }
    } else {
      textController.text += value;

      var amount = double.parse(textController.text);

      var receiveAmount = (exchangeRate.value * amount);

      receiveController.text = (receiveAmount).round().toString();
    }
  }

  void receiveAmount(String value, TextEditingController textController) {
    if (value == 'Forgot') {
      Get.toNamed(AppRoute.resetPasscode);
    } else if (value == '<') {
      if (textController.text.isNotEmpty) {
        textController.text =
            textController.text.substring(0, textController.text.length - 1);

        if (textController.text.isNotEmpty) {
          var amount = double.parse(textController.text);
          var rate = rubRate.value / xafRate.value;
          var receiveAmount = (rate * amount).round();
          amountController.text = receiveAmount.toString();
        } else {
          amountController.text = "";
        }
      } else {
        amountController.text = "";
      }
    } else {
      if (textController.text.contains(".") && value == ".") {
      } else {
        textController.text += value;
        var amount = double.parse(textController.text);
        var receiveAmount = (amount / exchangeRate.value);

        amountController.text = (receiveAmount).round().toString();
      }
    }
  }

  startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      final seconds = duration.value.inSeconds - addSeconds;
      duration.value = Duration(seconds: seconds);
      if (time.value != "0:00:00.000000") {
        time.value = duration.toString();
      } else {
        disableButton.value = true;

        Future.delayed(Duration.zero, () async {
          Get.offAllNamed(AppRoute.transactionCancelScreen);
        });

        timer?.cancel();
      }
    });
  }

  String formattedDuration() {
    // Parse the duration string
    List<String> parts = time.value.split(':');
    Duration duration = Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(
          parts[2].split('.')[0]), // Extract seconds without milliseconds
    );

    // Format the duration as needed
    String formattedDuration =
        "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";

    return formattedDuration;
  }

  confirmTimer(String gobalDate) {
    final currentDate = DateTime.now();

    final parsedDate = DateTime.parse(gobalDate);

    final difference = currentDate.difference(parsedDate);

    final remainingTime = Duration(minutes: 10) - difference;

    if (isConfirmation.value) {
      timer?.cancel();
      duration.value = Duration(
          minutes: remainingTime.inMinutes,
          seconds: remainingTime.inSeconds % 60);
      startTime();
      time.value = "0:10:00.00000";
    }
  }
}
