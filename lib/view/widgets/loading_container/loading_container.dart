import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class LoadingContainer extends StatelessWidget {
  LoadingContainer({
    super.key,
    this.width = double.infinity,
    this.height = 60,
    this.radius = 10,
    this.color = AppColors.primaryColor

  });

  double width, height, radius ;

  Color color ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
