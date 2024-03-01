import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_route/app_route.dart';
import '../../global/api_url.dart';
import '../../models/sign_up_model.dart';
import '../../services/api_services/api_services.dart';
import '../../utils/app_utils.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoadingSignUpScreen = false.obs;
  SignUpModel? signUpModelInfo;

  RxBool isResend = false.obs;
  RxBool isTerms = false.obs ;

  final duration = const Duration().obs;
  Timer? timer;
  RxString time = "0:03:00.000000".obs;

  RxString countryCode = "+7".obs;

  RxString countryISO = "RU".obs;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController otpController = TextEditingController();

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

  Future<void> signUpRepo() async {
    isLoadingSignUpScreen.value = true;

    var body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": numberController.text,
      "password": passwordController.text,
      "countryCode": countryCode.value,
      "countryISO": countryISO.value,
    };
    Map<String, String> header = {
      'Otp': 'OTP ',
    };

    SharedPreferences pref = await SharedPreferences.getInstance();

    networkApiService
        .postApi(ApiUrl.signUp, body, header)
        .then((apiResponseModel) {
      isLoadingSignUpScreen.value = false;
      if (apiResponseModel.statusCode == 200) {
        Get.toNamed(AppRoute.signUpOtp);
        pref.setString("email", emailController.text);
        timer?.cancel();

        duration.value = const Duration(minutes: 3);
        time.value = "0:03:00.00000";
        startTime();
      } else if (apiResponseModel.statusCode == 201) {
        Get.toNamed(AppRoute.signUpOtp);
        timer?.cancel();
        duration.value = const Duration(minutes: 3);
        time.value = "0:03:00.00000";
        startTime();
      } else if (apiResponseModel.statusCode == 409) {
        Utils.snackBarMessage("User already exists".tr,
            "if forgot your password please, reset your password".tr);
        Get.toNamed(AppRoute.forgotPassword);
      } else {
        Utils.snackBarMessage(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> signUpAuthRepo() async {
    isLoading.value = true;

    var body = {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": numberController.text,
      "password": passwordController.text,
      "countryCode": countryCode.value,
      "countryISO": countryISO.value,
    };
    Map<String, String> header = {
      'Otp': 'OTP ${otpController.text}',
    };

    networkApiService
        .postApi(ApiUrl.signUp, body, header)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        signUpModelInfo = SignUpModel.fromJson(json);
        Get.toNamed(AppRoute.passCode);
        nameController.clear();
        emailController.clear();
        numberController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);
        signUpModelInfo = SignUpModel.fromJson(json);
        Get.toNamed(AppRoute.passCode);
        nameController.clear();
        emailController.clear();
        numberController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      } else if (apiResponseModel.statusCode == 401) {
        Utils.snackBarMessage("Error".tr, "OTP is invalid".tr);
      } else if (apiResponseModel.statusCode == 400) {
        Utils.snackBarMessage("Error".tr, "OTP is invalid".tr);
      } else {
        Utils.snackBarMessage(
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
