import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../global/api_response_model.dart';
import '../../utils/app_utils.dart';

class NetworkApiService {
  Future<ApiResponseModel> postApi(
      String url, body, header,
      {isHeader = true}) async {
    dynamic responseJson;

    try {
      if (isHeader) {
        final response = await http
            .post(Uri.parse(url), body: body, headers: header)
            .timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      } else {
        final response = await http
            .post(Uri.parse(url), body: body)
            .timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      }
    } on SocketException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }

    return responseJson;
  }

  Future<ApiResponseModel> getApi(String url, Map<String, String> header,
      {isHeader = true}) async {
    dynamic responseJson;

    try {
      if (isHeader) {
        final response = await http
            .get(Uri.parse(url), headers: header)
            .timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      } else {
        final response =
            await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      }
    } on SocketException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }

    return responseJson;
  }

  Future<ApiResponseModel> putApi(
      String url, Map<String, String> body, Map<String, String> header) async {
    dynamic responseJson;

    try {
      final response = await http
          .put(Uri.parse(url), body: body, headers: header)
          .timeout(const Duration(seconds: 30));
      responseJson = handleResponse(response);
    } on SocketException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }

    return responseJson;
  }

  Future<ApiResponseModel> patchApi(
      String url, Map<String, String> body, Map<String, String> header,{isBody = true}) async {
    dynamic responseJson;

    try {

      if(isBody) {
        final response = await http
            .patch(Uri.parse(url), body: body, headers: header)
            .timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      } else{
        final response = await http
            .patch(Uri.parse(url), headers: header)
            .timeout(const Duration(seconds: 30));
        responseJson = handleResponse(response);
      }


    } on SocketException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(503, "No internet connection".tr, '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request".tr, '');
    } on TimeoutException {
      Utils.toastMessage("please, check your internet connection".tr) ;
      return ApiResponseModel(408, "Request Time Out".tr, "");
    }

    return responseJson;
  }

  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponseModel(200, 'Success'.tr, response.body);
      case 201:
        return ApiResponseModel(201, 'Success'.tr, response.body);
      case 401:
        // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(401, "Unauthorized".tr, response.body);
      case 400:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(400, "Unauthorized".tr, response.body);
      case 404:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(404, "Error".tr, response.body);
      case 409:
      // Get.offAllNamed(AppRoute.logIn);
        return ApiResponseModel(409, "User already exists".tr, response.body);
      default:
        print(response.statusCode) ;
        return ApiResponseModel(500, "Internal Server Error".tr, response.body);
    }
  }
}
