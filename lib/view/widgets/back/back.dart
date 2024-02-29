import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../image/custom_image.dart';
import '../text/custom_text.dart';

class Back extends StatelessWidget {
  const Back({super.key, this.fontSize = 18, this.text = "", this.onTap});

  final double fontSize;
  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(left: 14.w),
            child: Center(
                child: CircleAvatar(
                    backgroundColor: AppColors.white100,
                    child: ClipOval(
                        child: CustomImage(
                      imageSrc: AppIcons.arrowBackIos,
                      imageColor: AppColors.black100,
                      size: 16.sp,
                    )))),
          ),
        ),
        CustomText(
            text: text, fontSize: 18.sp, left: text.isNotEmpty ? 16.w : 0)
      ],
    );
  }
}
