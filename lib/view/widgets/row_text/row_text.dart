import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../text/custom_text.dart';

class RowText extends StatelessWidget {

  const RowText({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title.tr,color: AppColors.white50,fontSize: 18.sp,fontWeight: FontWeight.w400,right: 24.w),
        Flexible(child: CustomText(text: value.tr,fontSize: 18.sp,fontWeight: FontWeight.w400,right: 4.w,maxLines: 1)),
      ],
    );
  }
}
