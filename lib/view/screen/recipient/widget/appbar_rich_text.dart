




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';

class PaymentTextRich extends StatelessWidget {
  PaymentTextRich(
      {super.key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
        required this.fourText,
        this.maxLines =2,
        this.fontSize = 20 ,
        this.fontWeight = FontWeight.w600


      });

  String firstText;
  String secondText;
  String thirdText;
  String fourText;

  int maxLines;
  double fontSize ;
  FontWeight fontWeight ;





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
                  fontSize: fontSize,
                  fontWeight:fontWeight,
                ),
              ),
              TextSpan(
                text: secondText,
                style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text: thirdText,
                style: GoogleFonts.poppins(
                  color: AppColors.white100,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              TextSpan(
                text: fourText,
                style: GoogleFonts.poppins(
                  color: AppColors.primaryColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),

            ],
          ),
          textAlign : TextAlign.center,
          maxLines: maxLines,

        ),
      ],
    );
  }
}
