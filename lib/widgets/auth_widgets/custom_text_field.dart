import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/resources/app_colors.dart';
import 'package:test_app/resources/app_icons.dart';

class CustomTextField extends StatefulWidget {
  final bool obscureText;
  final String label;
  final TextEditingController controller;

  const CustomTextField(
      {this.obscureText = false,
      required this.label,
      required this.controller});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHidePassword;

  @override
  void initState() {
    isHidePassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 60.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0.sp),
        obscureText: isHidePassword,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 16.0.sp,
          ),
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: InputBorder.none,
          suffixIconConstraints:
              BoxConstraints(maxHeight: 36.0.w, maxWidth: 36.0.w),
          suffixIcon: Visibility(
            visible: widget.obscureText,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(6.0),
                shape: CircleBorder(),
                fixedSize: Size(36.0.w, 36.0.w),
              ),
              onPressed: () {
                setState(() {
                  isHidePassword = !isHidePassword;
                });
              },
              child: Image.asset(
                isHidePassword ? AppIcons.eyeIcon : AppIcons.eyeOffIcon,
                color: AppColors.darkGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
