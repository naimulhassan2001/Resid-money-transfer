import 'dart:convert';

import 'package:get/get.dart';

import '../global/api_url.dart';
import '../models/country_list_model.dart';
import '../services/api_services/api_services.dart';

class SelectCountryController extends GetxController {
  CountryListModel? countryList;





  RxBool isLoading = false.obs;

  NetworkApiService networkApiService = NetworkApiService();

  Future<void> allCountriesRepo() async {

    if(countryList == null) {

      Map<String, String> header = {};

      isLoading.value = true;


      networkApiService
          .getApi("https://russend.com/api/countries", header, isHeader: false)
          .then((apiResponseModel) {
        isLoading.value = false;

        if (apiResponseModel.statusCode == 200) {
          var json = jsonDecode(apiResponseModel.responseJson);
          countryList = CountryListModel.fromJson(json);
        } else if (apiResponseModel.statusCode == 201) {
          var json = jsonDecode(apiResponseModel.responseJson);
          countryList = CountryListModel.fromJson(json);
        } else {
          Get.snackbar(
              apiResponseModel.statusCode.toString(), apiResponseModel.message);
        }
      });
    } else {

    }

  }
}
