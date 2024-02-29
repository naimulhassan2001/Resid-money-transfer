import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../models/create_passcode_model.dart';
import '../services/api_services/api_services.dart';

class ConformPasscodeController extends GetxController {
  RxBool disableKeyboard = false.obs;

  CreatePasscodeModel? createPasscodeInfo;

  TextEditingController passcodeController = TextEditingController();

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> createPasscodeRepo(
      String passcodeToken, String clientId, String passcode) async {
    print("===================> object");

    var body = {"passcode": passcodeController.text, "clientId": clientId};
    print("===================>$body");
    Map<String, String> header = {
      'Pass-code': 'Pass-code $passcodeToken',
    };

    SharedPreferences pref = await SharedPreferences.getInstance();

    networkApiService
        .postApi(ApiUrl.createPasscode, body, header)
        .then((apiResponseModel) {
      print(apiResponseModel.responseJson);

      print(apiResponseModel.statusCode.toString());
      print(apiResponseModel.message.toString());
      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        createPasscodeInfo = CreatePasscodeModel.fromJson(json);
        pref.setString("accessToken", createPasscodeInfo!.data!.accessToken!);
        pref.setString("refreshToken", createPasscodeInfo!.data!.refreshToken!);
        pref.setString("id", createPasscodeInfo!.data!.attributes!.sId!);
        pref.setBool("isLogIn", true);
        pref.setBool("isForgotPasscode", false);


        SharedPreferenceHelper.accessToken =
            createPasscodeInfo!.data!.accessToken!;
        SharedPreferenceHelper.refreshToken =
            createPasscodeInfo!.data!.refreshToken!;
        SharedPreferenceHelper.id = createPasscodeInfo!.data!.attributes!.sId!;
        SharedPreferenceHelper.isForgotPasscode = false;


        Get.offAllNamed(AppRoute.transaction);
      } else {
        Get.toNamed(AppRoute.createAccount);
        Get.snackbar("Error", "Some Thing is Wrong");
      }
    });
  }
}
