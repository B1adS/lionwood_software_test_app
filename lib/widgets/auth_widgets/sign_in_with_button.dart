import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/resources/app_colors.dart';

class SignInWithButton extends StatelessWidget {
  final String image;
  final double height;
  final double width;

  const SignInWithButton(
      {required this.image, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0.w,
      width: 98.0.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightBlackBorder),
      ),
      child: TextButton(
        onPressed: () {},
        child: Image.asset(
          image,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
