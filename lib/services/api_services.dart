// import 'dart:convert';
// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../core/app_route/app_route.dart';
// import '../global/api_authorization_response_model.dart';
// import '../global/api_response_method.dart';
// import '../global/api_response_model.dart';
// import 'package:http/http.dart' as http;
// import '../helper/shared_preference_helper.dart';
//
//
// class ApiService extends GetxService{
//
//   SharedPreferences sharedPreferences;
//   ApiService({required this.sharedPreferences});
//
//   Future<ApiResponseModel> request(
//       String uri,
//       String method,
//       Map<String, dynamic>? params, {bool passHeader = false, isRawData = true}) async {
//
//     Uri url = Uri.parse(uri);
//     http.Response response;
//
//
//
//
//
//     try {
//       if (method == ApiResponseMethod.postMethod) {
//         if(passHeader){
//           initToken();
//           response = await http.post(
//             url,
//             headers: {
//               "Content-Type": "application/json",
//               "Authorization": "$tokenType $token"
//             },
//             body: isRawData ? jsonEncode(params) : params,
//           );
//         }
//         else{
//           response = await http.post(
//               url,
//               body: params
//           );
//         }
//       }
//       else if (method == ApiResponseMethod.deleteMethod) {
//         response = await http.delete(url);
//       }
//       else if (method == ApiResponseMethod.updateMethod) {
//         response = await http.patch(url);
//       }
//       else {
//         if(passHeader){
//           initToken();
//           response = await http.get(
//               url,headers: {
//             "Content-Type": "application/json",
//             "Authorization": "$tokenType $token"
//           });
//         }
//         else{
//           response = await http.get(url);
//         }
//       }
//
//
//
//
//
//
//
//
//
//       print(url.toString());
//       print(response.body);
//
//
//       if (response.statusCode == 200) {
//         try{
//           ApiAuthorizationResponseModel authorizationResponseModel = ApiAuthorizationResponseModel.fromJson(jsonDecode(response.body));
//           if(authorizationResponseModel.message == 'Unauthenticated' ){
//             sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
//             sharedPreferences.remove(SharedPreferenceHelper.token);
//             Get.offAllNamed(AppRoute.logIn);
//           }
//         }catch(e){
//           e.toString();
//         }
//
//         return ApiResponseModel(200, 'Success', response.body);
//       }else if (response.statusCode == 201) {
//         return ApiResponseModel(201, 'Success', response.body);
//       }
//       else if (response.statusCode == 401) {
//         sharedPreferences.setBool(SharedPreferenceHelper.rememberMeKey, false);
//         Get.offAllNamed(AppRoute. logIn);
//         return ApiResponseModel(401, "Unauthorized".tr, response.body);
//       } else {
//         return ApiResponseModel(500, "Internal Server Error".tr, response.body);
//       }
//
//
//
//
//     } on SocketException {
//       return ApiResponseModel(503, "No internet connection".tr, '');
//     } on FormatException {
//       return ApiResponseModel(400, "Bad Response Request".tr, '');
//     }
//   }
//
//   String token = '';
//   String tokenType = '';
//
//   initToken() {
//     if (sharedPreferences.containsKey(SharedPreferenceHelper.accessTokenKey)) {
//       String? t = sharedPreferences.getString(SharedPreferenceHelper.accessTokenKey);
//       String? tType = sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
//       token = t ?? '';
//       tokenType = tType ?? 'Bearer';
//     } else {
//       token = '';
//       tokenType = 'Bearer';
//     }
//   }
// }