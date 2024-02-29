import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_route/app_route.dart';
import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../models/enter_passcode_model.dart';
import '../services/api_services/api_services.dart';
import '../utils/app_utils.dart';

class EnterPasscodeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool disableKeyboard = false.obs;

  EnterPasscodeModel? enterPasscodeModelInfo;

  String accessToken = "";

  TextEditingController enterController = TextEditingController();

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> enterPasscodeRepo(String passcodeToken) async {
    var body = {
      "passcode": enterController.text,
    };
    Map<String, String> header = {
      'Pass-code': 'Pass-code $passcodeToken',
    };

    isLoading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();

    networkApiService
        .postApi(ApiUrl.verifyPasscode, body, header)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);
        enterPasscodeModelInfo = EnterPasscodeModel.fromJson(json);
        EnterPasscodeModel enterPasscodeModel = enterPasscodeModelInfo!;
        pref.setString("accessToken", enterPasscodeModel.data!.accessToken!);
        pref.setString("refreshToken", enterPasscodeModel.data!.refreshToken!);
        pref.setBool("isLogIn", true);
        SharedPreferenceHelper.accessToken =
            enterPasscodeModel.data!.accessToken!;
        accessToken = enterPasscodeModel.data!.accessToken!;
        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);
        enterPasscodeModelInfo = EnterPasscodeModel.fromJson(json);
        EnterPasscodeModel enterPasscodeModel = enterPasscodeModelInfo!;
        pref.setString("accessToken", enterPasscodeModel.data!.accessToken!);
        pref.setString("refreshToken", enterPasscodeModel.data!.refreshToken!);
        pref.setBool("isLogIn", true);
        accessToken = enterPasscodeModel.data!.accessToken!;
        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 401) {
        disableKeyboard.value = false;
        enterController.clear();

        Utils.toastMessage("passcode is incorrect, please try again later");
      } else if (apiResponseModel.statusCode == 404) {
        disableKeyboard.value = false;
        enterController.clear();

        Utils.toastMessage("passcode is incorrect, please try again later");
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> signInWithPasscodeRepo(String email) async {
    var body = {
      "email": email,
      "passcode": enterController.text,
    };
    Map<String, String> header = {};

    isLoading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();

    networkApiService
        .postApi(ApiUrl.signInWithPasscode, body, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        enterPasscodeModelInfo = EnterPasscodeModel.fromJson(json);

        EnterPasscodeModel enterPasscodeModel = enterPasscodeModelInfo!;

        pref.setString("accessToken", enterPasscodeModel.data!.accessToken!);
        pref.setBool("isLogIn", true);

        accessToken = enterPasscodeModel.data!.accessToken!;

        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);

        enterPasscodeModelInfo = EnterPasscodeModel.fromJson(json);

        EnterPasscodeModel enterPasscodeModel = enterPasscodeModelInfo!;

        pref.setString("accessToken", enterPasscodeModel.data!.accessToken!);
        pref.setBool("isLogIn", true);

        accessToken = enterPasscodeModel.data!.accessToken!;

        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 401) {
        enterController.clear();
        disableKeyboard.value = false;
        Utils.toastMessage("passcode is incorrect, please try again later".tr);
      } else if (apiResponseModel.statusCode == 404) {
        disableKeyboard.value = false;
        enterController.clear();
        Utils.toastMessage("passcode is incorrect, please try again later".tr);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }
}
