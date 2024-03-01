

import 'package:flutter/material.dart';
import 'package:resid_money_transfer/utils/app_images.dart';
import 'package:resid_money_transfer/view/widgets/image/custom_image.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomImage(imageSrc: AppImages.card, imageType: ImageType.png,);
  }
}
