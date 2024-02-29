import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/keyboard_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../image/custom_image.dart';
import '../text/custom_text.dart';

class CustomKeyboard extends StatelessWidget {
  CustomKeyboard(
      {super.key,
      required this.controller,
      this.isForgot = false,
      this.isPoint = false});

  KeyboardController keyboardController = Get.put(KeyboardController());
  TextEditingController controller;

  bool isForgot;
  bool isPoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(['1', '2', '3']),
        buildRow(['4', '5', '6']),
        buildRow(['7', '8', '9']),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: isForgot
                  ? () => keyboardController.onKeyPressed("Forgot", controller)
                  : () {},
              child: isPoint
                  ? TextButton(
                onPressed: () =>
                          keyboardController.onKeyPressed(".", controller),
                      child:  Container(
                        width: 60.sp,
                        height: 60.sp,
                        child: Center(
                          child: CustomText(
                            text: '.',
                            textAlign: TextAlign.center,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )
                  :  Container(
                width: 60.sp,
                height: 60.sp,
                    child: Center(
                      child: CustomText(
                          text: "Forgot".tr,
                          color:
                              isForgot ? AppColors.white100 : AppColors.background,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                    ),
                  ),
            ),
            TextButton(
              onPressed: () => keyboardController.onKeyPressed("0", controller),
              child:  Container(
                width: 60.sp,
                height: 60.sp,
                child: Center(
                  child: CustomText(
                    text: '0',
                    textAlign: TextAlign.center,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => keyboardController.onKeyPressed("<", controller),
              child: Container(
                width: 60.sp,
                height: 60.sp,
                child: Center(
                  child: CustomImage(
                    imageType: ImageType.png,
                    imageSrc: AppIcons.cross,
                    imageColor: AppColors.white100,
                    size: 20.sp,

                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: keys
          .map((key) => TextButton(
                onPressed: () => keyboardController.onKeyPressed(key, controller),
                child: Container(
                  width: 60.sp,
                  height: 60.sp,
                  child: Center(
                    child: CustomText(
                      text: key,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
