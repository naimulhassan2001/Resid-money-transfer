import 'package:flutter/material.dart';
import 'package:resid_money_transfer/utils/app_colors.dart';
import 'package:resid_money_transfer/utils/app_icons.dart';
import 'package:resid_money_transfer/view/screen/account_holder/inner_widget/bank_card.dart';
import 'package:resid_money_transfer/view/widgets/image/custom_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_route/app_route.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';


class AccountHolder extends StatelessWidget {
  const AccountHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        appBarContent: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () => Get.toNamed(AppRoute.notification),
                child: CustomImage(imageSrc: AppIcons.bell, size: 24.h, imageColor: AppColors.white100,)),
            GestureDetector(
                onTap: () => Get.toNamed(AppRoute.profile),
                child: CustomImage(imageSrc: AppIcons.profile, size: 24.h,imageColor: AppColors.white100,)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            BankCard()

          ],
        ),
      ),
    );
  }
}
