import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/text/custom_text.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {


    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ".tr,
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.toNamed(AppRoute.logIn),
              text: "Sign In".tr,
              style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
      textAlign: TextAlign.center,
    );


    // return Wrap(
    //     spacing: 10.0,
    //     // runSpacing: 10.0,
    //     children: [
    //       CustomText(
    //         text: "Already have an account? ".tr,
    //         fontSize: 15.sp,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       GestureDetector(
    //           onTap: () => Get.toNamed(AppRoute.logIn),
    //           child: CustomText(
    //             text: "Sign in".tr,
    //             fontSize: 15.sp,
    //             color: AppColors.primaryColor,
    //             fontWeight: FontWeight.w600,
    //           ))
    //     ]);
  }
}
