import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


import '../../../../controller/personal_info_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/back/back.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/text/custom_text.dart';

class EditPhoneNumberScreen extends StatelessWidget {
  EditPhoneNumberScreen({super.key});

  PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(appBarContent: Back(onTap: () => Get.back())),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Enter your new phone number".tr,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  bottom: 30.h),
              IntlPhoneField(
                controller: personalInfoController.numberController,
                onChanged: (value) {
                  personalInfoController.countryCode.value = value.countryCode;
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: "Phone Number".tr,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                initialCountryCode: personalInfoController.userDetailsModelInfo?.data?.attributes?.countryISO ?? "RU",
                // disableLengthCheck: true,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  titleText: "Save".tr,
                  buttonRadius: 50.r,
                  buttonWidth: 150.w,
                  onPressed: () {
                    personalInfoController.editNumberRepo();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
