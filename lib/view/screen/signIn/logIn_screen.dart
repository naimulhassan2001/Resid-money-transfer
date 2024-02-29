import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../controller/sign_in_controller.dart';
import '../../../core/app_route/app_route.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../widgets/custom_button/custom_button.dart';
import '../../widgets/image/custom_image.dart';
import '../../widgets/loading_container/loading_container.dart';
import '../../widgets/text/custom_text.dart';
import 'inner_widget/logIn_filed.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final formKey = GlobalKey<FormState>();

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: InkWell(
            onTap: () => Get.toNamed(AppRoute.languageScreen),
            child: CustomImage(
                imageSrc: AppIcons.language,
                imageColor: AppColors.white100,
                size: 20.sp),
          ),
        ),
        title: InkWell(
          onTap: () => Get.toNamed(AppRoute.languageScreen),
          child: CustomText(
              text: "English".tr, fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogInFiled(),
                  Column(
                    children: [

                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () => signInController.whatsAppTo(),
                            child: CustomImage(imageSrc: AppImages.whatsapp, imageType: ImageType.png, size: 50.sp,)),
                      ),
                      SizedBox(height: 16.h,),
                      Obx(
                        () => Center(
                          child: signInController.isLoading.value
                              ? LoadingContainer()
                              : CustomButton(
                                  titleText: "Sign In".tr,
                                  buttonRadius: 12.r,
                                  buttonWidth: double.infinity,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      signInController.signInRepo();
                                    }
                                  }),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CustomText(
                              text: "Don’t have an account? ".tr,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.createAccount),
                              child: CustomText(
                                text: "Sign up".tr,
                                fontSize: 14.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
