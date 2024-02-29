import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../models/forget_password_otp_model.dart';
import '../services/api_services/api_services.dart';
import '../utils/app_utils.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordOtpModel? forgetPasswordOtpInfo;
  RxBool isLoadingEmailScreen = false.obs;
  RxBool isLoading = false.obs;

  RxBool isResend = false.obs;
  final duration = const Duration().obs;
  Timer? timer;
  RxString time = "0:03:00.000000".obs;


  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  NetworkApiService networkApiService = NetworkApiService();

  String? validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password'.tr;
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password'.tr;
      } else {
        return null;
      }
    }
  }


  Future<void> forgetPasswordRepo() async {
    isLoadingEmailScreen.value = true;
    var body = {
      "email": emailController.text,
    };

    Map<String, String> header = {};
    networkApiService
        .postApi(ApiUrl.forgetPassword, body, header, isHeader: false)
        .then((apiResponseModel) {
      isLoadingEmailScreen.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        Get.toNamed(AppRoute.forgotPasswordVerify);
        timer?.cancel();
        duration.value = const Duration(minutes: 3);
        time.value = "0:03:00.000000";
        startTime();
      } else if (apiResponseModel.statusCode == 404) {
        Utils.toastMessage("User does not exist".tr);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> verifyOtpRepo() async {

    // isLoading.value = true;

    var body = {
      "email": emailController.text,
      "otp": otpController.text,
    };

    Map<String, String> header = {};

    networkApiService
        .postApi(ApiUrl.verifyOtp, body, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        forgetPasswordOtpInfo = ForgetPasswordOtpModel.fromJson(json);

        Get.toNamed(AppRoute.newPassword);
      } else if (apiResponseModel.statusCode == 400) {
        Utils.toastMessage("OTP is invalid, please try again");
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> resetPasswordRepo(String forgetPasswordToken) async {
    isLoading.value = true;

    var body = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    Map<String, String> header = {
      'Forget-password': 'Forget-password $forgetPasswordToken',
    };
    networkApiService
        .postApi(ApiUrl.resetPassword, body, header)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        emailController.clear();
        otpController.clear();
        passwordController.clear();
        confirmPasswordController.clear();

        Get.toNamed(AppRoute.createSuccessful);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  ///=============================> Send Again   < =============================


  startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      final seconds = duration.value.inSeconds - addSeconds;
      duration.value = Duration(seconds: seconds);
      if (time.value != "0:00:00.000000") {
        time.value = duration.toString();
      } else {
        isResend.value = true;
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

  whatsAppTo() async {
    Uri whatsappUrl = Uri.parse("https://wa.me/+8801865965581");
    await launchUrl(whatsappUrl);
  }

  // startTime() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (_) {
  //     const addSeconds = 1;
  //     final seconds = duration.inSeconds - addSeconds;
  //     duration = Duration(seconds: seconds);
  //     if (time.value != 0) {
  //       time.value = seconds;
  //     } else {
  //       isResend.value = true;
  //       timer?.cancel();
  //     }
  //   });
  // }
}
