


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/app_route/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/text/custom_text.dart';

class ListItem extends StatelessWidget {
  ListItem({
    super.key,
    required this.flag,
    required this.countryName,
    required this.countryToken,


  });


  String flag ;
  String countryName ;
  String countryToken ;





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  height: 50.h,width: 50.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                  ),
                  child: ClipOval(child: SvgPicture.network(flag),),
                ),
                Flexible(child: CustomText(text: countryName ,fontSize: 22.sp,left: 14.w,maxLines: 2,textAlign: TextAlign.start)),
              ],
            ),
          ),
          CustomText(text: countryToken ,fontSize: 22.sp,left: 24.w,color: AppColors.white50),
        ],
      ),
    ) ;
  }
}
