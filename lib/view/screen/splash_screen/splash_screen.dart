import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/app_route/app_route.dart';
import '../../../helper/shared_preference_helper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../widgets/image/custom_image.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  @override
  void initState() {
    sharedPreferenceHelper.getSharedPreferenceData();
    Timer(const Duration(seconds: 3), () {
      getIsLogIn();
    });
    super.initState();
  }

  Future<void> getIsLogIn() async {
    try {
      if (SharedPreferenceHelper.isLogIn) {
        Get.toNamed(AppRoute.enterPassCode);
      } else {
        Get.offAllNamed(AppRoute.onboardScreen);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        body: Center(
            child: CustomImage(
              imageSrc: AppImages.splashIcon,
              size: 180.w,
              imageType: ImageType.png,),

        ),
      ),
    );
  }
}
