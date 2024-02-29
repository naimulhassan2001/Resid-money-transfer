import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_route/app_route.dart';
import '../../global/api_url.dart';
import '../../models/enter_passcode_model.dart';
import '../../services/api_services/api_services.dart';
import '../../utils/app_utils.dart';
import '../enter_passcode_controller.dart';

class LocalAuthController extends GetxController {
  final LocalAuthentication auth = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  RxBool canCheckBiometrics = false.obs;
  RxList availableBiometrics = [].obs;
  RxString authorized = 'Not Authorized'.obs;
  RxBool isAuthenticating = false.obs;


  NetworkApiService networkApiService = NetworkApiService();

  EnterPasscodeController enterPasscodeController =
      Get.put(EnterPasscodeController());

  Future<void> authenticateWithBiometrics(bool mounted, String token) async {
    bool authenticated = false;
    print("======================> authenticateWithBiometrics");

    try {
      isAuthenticating.value = true;
      authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      isAuthenticating.value = false;
      authorized.value = 'Authenticating';
    } on PlatformException catch (e) {
      print(e);
      isAuthenticating.value = false;
      authorized.value = 'Error - ${e.message}';

      return;
    }
    if (!mounted) {
      return;
    }

    authenticated ? localAuthRepo(token) : const SizedBox();
    authorized.value = "message";
  }

  Future<void> localAuthRepo(String refreshToken) async {
    print("===================> localAuthRepo");

    Map<String, String> header = {
      'Refresh-token': "Refresh-token $refreshToken"
    };

    enterPasscodeController.isLoading.value = true;
    SharedPreferences pref = await SharedPreferences.getInstance();

    networkApiService
        .getApi(ApiUrl.localAuth, header)
        .then((apiResponseModel) async {
      enterPasscodeController.isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        enterPasscodeController.enterPasscodeModelInfo =
            EnterPasscodeModel.fromJson(json);

        pref.setString("accessToken",
            enterPasscodeController.enterPasscodeModelInfo!.data!.accessToken!);
        pref.setBool("isLogIn", true);

        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 201) {
        var json = jsonDecode(apiResponseModel.responseJson);

        enterPasscodeController.enterPasscodeModelInfo =
            EnterPasscodeModel.fromJson(json);

        pref.setString("accessToken",
            enterPasscodeController.enterPasscodeModelInfo!.data!.accessToken!);
        pref.setBool("isLogIn", true);

        Get.toNamed(AppRoute.welcomeScreen);
      } else if (apiResponseModel.statusCode == 401) {
        Utils.toastMessage("passcode is incorrect, please try again later");
        Get.offAllNamed(AppRoute.logIn);
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString("email", "");
        pref.setString("refreshToken", "");
        pref.setBool("isLogIn", false);
        pref.setBool("isLocalAuth", false);



      } else if (apiResponseModel.statusCode == 404) {
        Get.offAllNamed(AppRoute.logIn);
        Utils.toastMessage("passcode is incorrect, please try again later");
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setString("email", "");
        pref.setString("refreshToken", "");
        pref.setBool("isLogIn", false);
        pref.setBool("isLocalAuth", false);

      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
