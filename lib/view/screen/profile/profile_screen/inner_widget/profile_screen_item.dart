import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../widgets/image/custom_image.dart';
import '../../../../widgets/text/custom_text.dart';

class ProfileScreenItem extends StatelessWidget {
  ProfileScreenItem({
    super.key,
    required this.icon,
    required this.title,
  });

  String icon;

  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              CustomImage(
                  imageSrc: icon,
                  size: 28.h,
                  imageColor: AppColors.primaryColor),
              CustomText(
                  text: title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  left: 16.w)
            ],
          ),
        ),
        Divider(height: 1.h, color: AppColors.white50)
      ],
    );
  }
}
