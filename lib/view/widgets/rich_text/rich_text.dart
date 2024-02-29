import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';

class TextRichWidget extends StatelessWidget {
  TextRichWidget({
    super.key,
    required this.secondText,
    required this.firstText,
    this.thirdText = "",
    this.firstColor = AppColors.white50,
    this.secondColor = AppColors.white100,
    this.thirdColor = AppColors.white50,
    this.alignment = TextAlign.center,
    this.horizontal = 16,

  });

  String firstText;
  String secondText;
  String thirdText;
  Color? firstColor;
  Color? secondColor;
  Color? thirdColor;


  TextAlign alignment;
  double horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: firstText,
                  style: GoogleFonts.plusJakartaSans(
                    color: firstColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: secondText,
                  style: GoogleFonts.plusJakartaSans(
                    color: secondColor!,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                 TextSpan(
                  text: thirdText.isNotEmpty ? thirdText : " ",
                  style: GoogleFonts.plusJakartaSans(
                    color: thirdColor!,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            textAlign: alignment,
          ),
        ],
      ),
    );
  }
}
