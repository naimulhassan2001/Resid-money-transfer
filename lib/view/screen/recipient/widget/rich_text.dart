
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';

class RichTextWidget extends StatelessWidget {
  RichTextWidget(
      {super.key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
        this.secondColor = AppColors.primaryColor,
        this.textAlign = TextAlign.start,

      });

  String firstText;
  String secondText;
  String thirdText;
  TextAlign textAlign ;
  Color? secondColor;




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: firstText,
                style: GoogleFonts.poppins(
                  color: AppColors.white100,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: secondText,
                style: GoogleFonts.poppins(
                  color: secondColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: thirdText,
                style: GoogleFonts.poppins(
                  color: AppColors.white100,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign : textAlign,
        ),
      ],
    );
  }
}
