import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final Widget appBarContent;

  const CustomAppBar({
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = Colors.transparent,
    required this.appBarContent,
    super.key
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(appBarWidth ?? double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsetsDirectional.only(start: 20.w, top: 24.h, end: 20.w),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: widget.appBarBgColor
        ),
        child: widget.appBarContent,
      ),
    );
  }
}
