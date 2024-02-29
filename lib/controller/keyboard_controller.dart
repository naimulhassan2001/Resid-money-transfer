import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_route/app_route.dart';

class KeyboardController extends GetxController {



  void onKeyPressed(String value, TextEditingController textController) {
    if (value == 'Forgot') {
      Get.toNamed(AppRoute.resetPasscode);
    } else if (value == '<') {
      if (textController.text.isNotEmpty) {
        textController.text =
            textController.text.substring(0, textController.text.length - 1);
      }
    } else {
      textController.text += value;
    }
  }
}
