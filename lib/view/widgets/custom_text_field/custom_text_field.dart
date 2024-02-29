import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/app_colors.dart';
import '../text/custom_text.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.hintText = "",
      this.prefixSvgIcon,
      this.isPassword = false,
      this.controller,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.mexLength,
      this.validator,
      this.prefixText = "",
      this.paddingHorizontal = 16,
      this.paddingVertical = 16,
      this.inputFormatters,
      this.fillColor = AppColors.black50,
      this.suffixIcon});

  final String hintText;
  final Widget? prefixSvgIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final int? mexLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Color fillColor;
  final String prefixText;

  final double paddingHorizontal;

  final double paddingVertical;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      textInputAction: widget.textInputAction,
      maxLength: widget.mexLength,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(fontSize: 14.sp, color: AppColors.white100),
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        prefixIcon: widget.prefixSvgIcon,
        fillColor: widget.fillColor,


        //uffixIconConstraints: BoxConstraints(maxHeight:10.h,maxWidth: 10.h,minWidth: 10,minHeight: 10),
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
            horizontal: widget.paddingHorizontal,
            vertical: widget.paddingVertical),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        hintText: widget.hintText == "" ? " " : widget.hintText,
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14.sp,
          color:AppColors.white
        ),
        prefix: CustomText(
          text: widget.prefixText,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: toggle,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: 10.w),
                  child: obscureText
                      ? Icon(
                          Icons.visibility_off_outlined,
                          size: 20.sp,
                          color: AppColors.white50,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          color: AppColors.white50,
                          size: 20.sp,
                        ),
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
