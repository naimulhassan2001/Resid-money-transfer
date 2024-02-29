import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/enter_passcode_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  EnterPasscodeController enterPasscodeController = Get.put(EnterPasscodeController()) ;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () => Get.offAllNamed(AppRoute.transaction));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(imageSrc: AppIcons.appIcon,size: 200.h),
              CustomText(text: "${"Welcome back, Adrien!".tr}${enterPasscodeController.enterPasscodeModelInfo!.data!.attributes!.fullName}",fontSize: 20.sp,fontWeight: FontWeight.w600,top: 18.h)
            ],
          ),
        ),
      ),
    );
  }
}
