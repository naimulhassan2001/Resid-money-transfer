import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../helper/shared_preference_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});


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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Language".tr, fontSize: 24.sp, bottom: 42.h),
              InkWell(
                onTap: () async {
                  Get.updateLocale(const Locale("en", "US"));
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString("languageCode", "en");
                  pref.setString("countryCode", "US");
                  SharedPreferenceHelper.localizationCountryCode = "US" ;
                  SharedPreferenceHelper.localizationLanguageCode = "en" ;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "English",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                    Center(
                        child:
                        SharedPreferenceHelper.localizationCountryCode ==
                            "US"
                            ? CustomImage(
                            imageSrc: AppIcons.success,
                            imageColor: AppColors.primaryColor,
                            size: 18.h)
                            : const SizedBox())
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              InkWell(
                onTap: () async {
                  Get.updateLocale(const Locale("fr", "FR"));
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.setString("languageCode", "fr");
                  pref.setString("countryCode", "FR");
                  SharedPreferenceHelper.localizationCountryCode = "FR" ;
                  SharedPreferenceHelper.localizationLanguageCode = "fr" ;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: "Francais",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400),
                    Center(
                        child:
                        SharedPreferenceHelper.localizationCountryCode ==
                            "FR"
                            ? CustomImage(
                            imageSrc: AppIcons.success,
                            imageColor: AppColors.primaryColor,

                            size: 18.h)
                            : const SizedBox())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
