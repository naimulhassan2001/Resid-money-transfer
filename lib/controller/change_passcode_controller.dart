import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../services/api_services/api_services.dart';
import '../utils/app_utils.dart';

class ChangePasscodeController extends GetxController {
  RxBool disableKeyboard = false.obs;
  RxBool isLoading = false.obs;
  RxString passcodeToken = "".obs;

  TextEditingController enterPasscodeController = TextEditingController();

  NetworkApiService networkApiService = NetworkApiService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();


  Future<void> changePasscodeRepo() async {
    isLoading.value = true;
    var body = {
      "passcode": enterPasscodeController.text,
    };

    Map<String, String> header = {'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}"};

    networkApiService
        .postApi(ApiUrl.verifyOldPasscode, body, header)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        passcodeToken.value = json["data"]["passcodeToken"];

        Get.toNamed(AppRoute.newPasscode);
      } else if (apiResponseModel.statusCode == 404) {
        Utils.toastMessage("passcode not match".tr);
      }else if (apiResponseModel.statusCode == 400) {
        Utils.toastMessage("passcode not match".tr);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }
}
