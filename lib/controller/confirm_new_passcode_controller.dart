import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../services/api_services/api_services.dart';
import '../utils/app_utils.dart';
import 'change_passcode_controller.dart';

class ConfirmPasscodeController extends GetxController {
  RxBool disableKeyboard = false.obs;
  RxBool isLoading = false.obs;

  TextEditingController newPasscodeController = TextEditingController();
  TextEditingController confirmPasscodeController = TextEditingController();

  NetworkApiService networkApiService = NetworkApiService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  ChangePasscodeController changePasscodeController =
      Get.put(ChangePasscodeController());



  Future<void> changePasscodeRepo() async {
    isLoading.value = true;
    var body = {
      "newPasscode": confirmPasscodeController.text,
    };

    Map<String, String> header = {
      'Pass-code': "Pass-code ${changePasscodeController.passcodeToken.value}",
      'Authorization': "Bearer ${SharedPreferenceHelper.accessToken}"
    };

    networkApiService
        .patchApi(ApiUrl.changePasscode, body, header)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        Get.offAllNamed(AppRoute.transaction);
      } else if (apiResponseModel.statusCode == 401) {
        Utils.toastMessage("passcode not match".tr);
      } else if (apiResponseModel.statusCode == 404) {
        Utils.toastMessage("passcode not match".tr);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }
}
