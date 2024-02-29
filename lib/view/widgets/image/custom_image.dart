import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resid_money_transfer/utils/app_colors.dart';

enum ImageType{
  png,
  svg,
}

class CustomImage extends StatefulWidget {

  final String imageSrc;
  final Color? imageColor;
  final double? size;
  final ImageType imageType;

  const CustomImage({

    required this.imageSrc,
    this.imageColor,
    this.size,
    this.imageType = ImageType.svg,
    super.key,
  });

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {

  late Widget imageWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.imageType == ImageType.svg){
      imageWidget = SvgPicture.asset(
        widget.imageSrc,
        color: widget.imageColor,
        height: widget.size, width: widget.size,
      );
    }

    if(widget.imageType == ImageType.png){
      imageWidget = Image.asset(
        widget.imageSrc,
        color: widget.imageColor,
        height: widget.size, width: widget.size,
      );
    }

    return SizedBox(
        height: widget.size, width: widget.size,
        child: imageWidget
    );
  }
}