

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resid_money_transfer/utils/app_colors.dart';

import '../../../widgets/text/custom_text.dart';

class SuccessfulItem extends StatelessWidget {
  SuccessfulItem({
    super.key,
    required this.title,
    required this.service,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.white100


  });

  String title ;
  String service ;
  FontWeight fontWeight ;
  Color? color  ;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        CustomText(text: title, fontSize: 16.sp, fontWeight:  fontWeight),
        Flexible(child: CustomText(text: service, fontSize: 16.sp, color: color!, overflow: TextOverflow.ellipsis,))
      ],
    );
  }
}
