import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class UserSignInScreen extends StatefulWidget {
  const UserSignInScreen({super.key});

  @override
  State<UserSignInScreen> createState() => _UserSignInScreenState();
}

class _UserSignInScreenState extends State<UserSignInScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 24.h,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 18,
          splashRadius: 22.r,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: defaultPadding.sp,
            right: defaultPadding.sp,
            top: defaultPadding.sp),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: defaultPadding.sp),
                Text(
                  'Welcome Back,',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kPrimaryDark),
                ),
                SizedBox(height: defaultPadding.sp),
                Text(
                  'Login to your Zoomlion account',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.sp,
                        color: AppColor.kBlackColor.withOpacity(0.75),
                      ),
                ),
                SizedBox(height: defaultPadding.sp),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTextField(
                        hintText: 'Enter your mobile number',
                        isPassword: false,
                        hasError: false,
                        titleText: 'Email or Mobile Number',
                        keyboardType:
                            TextInputType.numberWithOptions(signed: true),
                        textInputAction: TextInputAction.next,
                      ),
                      const AppTextField(
                        hintText: 'Enter your password',
                        isPassword: true,
                        hasError: false,
                        titleText: 'Password',
                        assetName: 'assets/icons/checkcircle.svg',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                        ),
                        onPressed: () => {
                          debugPrint('Forgot Password'),
                          Navigator.of(context).pushReplacementNamed(
                              RouteGenerator.recoverAccount),
                        },
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.kSecondaryAlt,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: defaultPadding.sp * 3),
                AppButton(
                  btnLabel: 'Login',
                  press: () => {
                    debugPrint('Login'),
                    Navigator.of(context)
                        .pushReplacementNamed(RouteGenerator.userTabs),
                  },
                ),
                SizedBox(height: 0.32.sh),
                buildSignUpTextBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildSignUpTextBtn() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account? ',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.kBlackColor.withOpacity(0.75),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            onPressed: () => {
              debugPrint('Sign Up'),
              Navigator.of(context)
                  .pushReplacementNamed(RouteGenerator.signUpScreen),
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.kPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
