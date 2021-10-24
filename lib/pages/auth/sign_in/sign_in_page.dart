import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/blocs/sign_in/sign_in_bloc.dart';
import 'package:test_app/pages/auth/success_auth/success_auth_page.dart';
import 'package:test_app/resources/app_colors.dart';
import 'package:test_app/resources/app_icons.dart';
import 'package:test_app/resources/app_strings.dart';
import 'package:test_app/widgets/auth_widgets/custom_text_field.dart';
import 'package:test_app/widgets/auth_widgets/sign_in_with_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SignInBloc _signInBloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _signInBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SuccessAuthPage(state.userModel),
                ),
              );
            }
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 74.0.w,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            AppStrings.signIn,
                            style: TextStyle(
                                fontSize: 36.0.sp,
                                color: AppColors.mainBlue,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 40.0.w,
                        ),
                        CustomTextField(
                          controller: _emailController,
                          label: AppStrings.email,
                        ),
                        SizedBox(
                          height: 30.0.w,
                        ),
                        CustomTextField(
                          controller: _passwordController,
                          label: AppStrings.password,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10.0.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: AppStrings.forgotPassword,
                                style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontSize: 16.0.sp),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 31.0.w,
                        ),
                        Container(
                          height: 60.0.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.mainBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                _signInBloc.add(
                                  SignIn(_emailController.text,
                                      _passwordController.text),
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.signIn,
                                  style: TextStyle(
                                      fontSize: 18.0.sp,
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0.w,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Divider(
                                  color: AppColors.darkGrey,
                                  height: 36.0.w,
                                ),
                              ),
                            ),
                            Text(
                              AppStrings.orSignInWith,
                              style: TextStyle(
                                  color: AppColors.darkGrey, fontSize: 16.0.sp),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Divider(
                                  color: AppColors.darkGrey,
                                  height: 36.0.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SignInWithButton(
                                image: AppIcons.googleIcon,
                                width: 25.0.w,
                                height: 25.0.w),
                            Spacer(),
                            SignInWithButton(
                                image: AppIcons.facebookIcon,
                                width: 27.0.w,
                                height: 27.0.w),
                            Spacer(),
                            SignInWithButton(
                                image: AppIcons.appleIcon,
                                width: 22.0.w,
                                height: 27.0.w),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
