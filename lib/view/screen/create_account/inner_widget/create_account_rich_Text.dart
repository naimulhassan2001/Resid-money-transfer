import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';

class CreateAccountTermsConditions extends StatelessWidget {
  const CreateAccountTermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By signing up you agree to our '.tr,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppRoute.legalScreen) ;
              },
            text: 'Terms'.tr,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppRoute.legalScreen) ;
              },
            text: 'and'.tr,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(AppRoute.legalScreen) ;
              },
            text: 'Conditions'.tr,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: '.',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.white100,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
