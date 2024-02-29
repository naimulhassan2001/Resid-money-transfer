import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/text/custom_text.dart';


class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool switchOn = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Appearance".tr, fontSize: 24.sp, bottom: 42.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                        text: "Dark mode".tr,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        right: 24.w),
                  ),
                  Switch(
                    value: switchOn,
                    activeColor: AppColors.primaryColor,
                    activeTrackColor: AppColors.primaryColor,
                    inactiveTrackColor: AppColors.white50,
                    thumbColor: const MaterialStatePropertyAll(AppColors.white),
                    onChanged: (value) {
                      setState(() {
                        switchOn = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
