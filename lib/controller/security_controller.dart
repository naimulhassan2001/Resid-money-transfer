import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityController extends GetxController {
  final controller = ValueNotifier<bool>(false);

  @override
  void onInit() {
    getLocalAuth();
    controller.addListener(() {
      setLocalAuth(controller.value);
    });
    super.onInit();
  }

  Future<void> setLocalAuth(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setBool("isLocalAuth", value);
  }

  Future<void> getLocalAuth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    controller.value = pref.getBool("isLocalAuth") ?? false;
  }
}
