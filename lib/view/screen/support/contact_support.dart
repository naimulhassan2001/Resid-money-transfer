import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/back/back.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/text/custom_text.dart';


class ContactSupport extends StatelessWidget {
  ContactSupport({super.key});

  emailTo() async {
    Uri dialEmail = Uri(scheme: 'mailto', path: "Support@russend.com" );
    await launchUrl(dialEmail);
  }

  whatsAppTo() async {
    Uri whatsappUrl = Uri.parse("https://wa.me/message/N3RLUWZ2CUBYO1");
    await launchUrl(whatsappUrl);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 24.h),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                      text: "Contact Support".tr,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400,
                      bottom: 24.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: whatsAppTo,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor,width: 1.w,style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white25
                            ),
                            child: CustomImage(imageSrc: AppIcons.whatsapp,size: 50.h, imageColor: AppColors.white100,),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: InkWell(
                          onTap: emailTo,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor,width: 1.w,style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.white25
                            ),
                            child: CustomImage(imageSrc: AppIcons.email,size: 50.h, imageColor: AppColors.white100,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CustomText(text: "To help us serve you better, kindly have your transaction ID ready. This unique identifier can be found in your transaction located on your account dashboard.".tr,
                fontSize: 14.sp,color: AppColors.white50,maxLines: 7)
            ],
          ),
        ),
      ),
    );
  }
}
