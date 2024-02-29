import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';
import 'widget/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Center(
              child: Container(
                  width: 75,
                  height: 75,
                  decoration: const ShapeDecoration(
                    color: Color(0x7FD9D9D9),
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFFB278FB)),
                    ),
                  ),
                  child: Center(
                      child: CustomText(
                    text: "A".tr,
                    fontSize: 40,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                  ))),
            ),
            const SizedBox(height: 16,),
            CustomText(text: "ADRIEN WANDJI NGAHA".tr, fontSize: 18,fontWeight: FontWeight.w400,),
            const SizedBox(height: 16,),

            SettingItem(title: "Personal info".tr, image: AppIcons.person, onTap: (){
              Get.toNamed(AppRoute.profileInfo) ;
            }),
            SettingItem(title: "Security".tr, image: AppIcons.security, onTap: (){}),
            SettingItem(title: "Language".tr, image: AppIcons.language, onTap: (){}),
            SettingItem(title: "Appearance".tr, image: AppIcons.appearance, onTap: (){}),
            SettingItem(title: "Legal".tr, image: AppIcons.legal, onTap: (){}),
            const Divider(),


            const Spacer(),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomImage(imageSrc: AppIcons.info, size: 30),
                const SizedBox(width: 4,),
                CustomText(text: "Contact support".tr, fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.primaryColor,)
              ],
            )



          ],
        ),
      ),
    );
  }
}
