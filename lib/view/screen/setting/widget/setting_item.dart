

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_icons.dart';
import '../../../widgets/image/custom_image.dart';
import '../../../widgets/text/custom_text.dart';

class SettingItem extends StatelessWidget {
  SettingItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,

  });


  String title ;
  String image ;
  Function onTap ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        GestureDetector(
          onTap: (){
            onTap() ;
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CustomImage(imageSrc: image,size: 30),
                const SizedBox(width: 16,),
                CustomText(text: title, fontWeight: FontWeight.w400, fontSize: 18,)

              ],
            ),
          ),
        ),
      ],
    );
  }
}
