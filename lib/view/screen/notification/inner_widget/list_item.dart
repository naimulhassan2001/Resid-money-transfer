

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/text/custom_text.dart';

class ListItem extends StatelessWidget {
  ListItem({
    super.key,
     required this.title,
     required this.time,
  });

  String title ;
  String time ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: title,
            fontSize: 14.sp,
            maxLines: 2,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400),
        CustomText(
            text: time,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            top: 4.h,
            color: AppColors.white50,
            bottom: 8.h),
        Divider(height: 1.h, color: AppColors.primaryColorLight),
        SizedBox(height: 16.h)
      ],
    );
  }
}
