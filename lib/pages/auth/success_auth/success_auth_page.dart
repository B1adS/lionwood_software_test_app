import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/resources/app_colors.dart';
import 'package:test_app/resources/app_icons.dart';
import 'package:test_app/resources/app_strings.dart';

class SuccessAuthPage extends StatelessWidget {
  final UserModel userModel;

  SuccessAuthPage(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 194.0.w,
              ),
              Image.asset(
                AppIcons.logoIcon,
                height: 114.5.w,
                width: 59.0.w,
              ),
              SizedBox(
                height: 40.0.w,
              ),
              Text(
                AppStrings.loginSuccessful,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 26.0.w,
              ),
              Text(
                '${AppStrings.name} ${userModel.name}',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '${AppStrings.surname} ${userModel.surname}',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 36.0.w,
              ),
              Container(
                height: 60.0.w,
                width: 335.0.w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.goToHomeScreen,
                        style: TextStyle(
                            fontSize: 18.sp, color: AppColors.mainBlue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
