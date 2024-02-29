import 'dart:convert';

import 'package:get/get.dart';


import '../global/api_url.dart';
import '../models/content_model.dart';
import '../services/api_services/api_services.dart';
import '../view/widgets/flutter_content/content_screen.dart';

class LegalController extends GetxController {
  ContentModel? contentModelInfo;

  RxBool isLoading = false.obs;

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> termsOfMoneyTransferRepo() async {
    contentModelInfo = null;
    Get.to(ContentScreen());


    Map<String, String> header = {};

    isLoading.value = true;

    networkApiService
        .getApi(ApiUrl.termsOfMoneyTransfer, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        contentModelInfo = ContentModel.fromJson(json);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> termsOfServiceRepo() async {

    contentModelInfo = null;

    Get.to(ContentScreen());

    Map<String, String> header = {};

    isLoading.value = true;

    networkApiService
        .getApi(ApiUrl.termsOfService, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        contentModelInfo = ContentModel.fromJson(json);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> personDataPolicyRepo() async {

    contentModelInfo = null;

    Get.to(ContentScreen());

    Map<String, String> header = {};

    isLoading.value = true;

    networkApiService
        .getApi(ApiUrl.personalDataPolicies, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        contentModelInfo = ContentModel.fromJson(json);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }

  Future<void> refundAndCancellationPolicyRepo() async {
    contentModelInfo = null;

    Get.to(ContentScreen());

    Map<String, String> header = {};

    isLoading.value = true;

    networkApiService
        .getApi(ApiUrl.refundAndCancellationPolicy, header, isHeader: false)
        .then((apiResponseModel) {
      isLoading.value = false;

      if (apiResponseModel.statusCode == 200) {
        var json = jsonDecode(apiResponseModel.responseJson);

        contentModelInfo = ContentModel.fromJson(json);
      } else {
        Get.snackbar(
            apiResponseModel.statusCode.toString(), apiResponseModel.message);
      }
    });
  }
}
