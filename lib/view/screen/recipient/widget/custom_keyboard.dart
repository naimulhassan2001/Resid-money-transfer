import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resid_money_transfer/utils/app_colors.dart';


import '../../../../utils/app_icons.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';


class amountSendCustomKeyboard extends StatelessWidget {
  amountSendCustomKeyboard(
      {super.key,
        required this.controller,
        required this.onTap,
        this.isForgot = false,
        this.isPoint = false});

  // AmountSendController amountSendController = Get.put(AmountSendController()) ;
  TextEditingController controller;

  bool isForgot;
  bool isPoint;
  RxBool isPay = true.obs ;
  Function(String value, TextEditingController textController) onTap ;

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
            GestureDetector(
              child:  TextButton(
                onPressed:  () =>
                    onTap(".", controller),
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
              ),
            ),
            TextButton(
              onPressed:  () => onTap("0", controller),
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
              onPressed:  () => onTap("<", controller),
              child: Container(
                width: 60.sp,
                height: 60.sp,
                child: Center(
                  child: CustomImage(
                    imageType: ImageType.png,
                    imageSrc: AppIcons.cross,
                    size: 20.sp,
                    imageColor: AppColors.white100,

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
        onPressed: () => onTap(key, controller),
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
