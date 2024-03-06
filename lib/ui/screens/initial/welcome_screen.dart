import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes.dart';
import '../../../theme/app_style.dart';
import '../../components/app_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldColor,
      body: Stack(
        children: [
          // Container(
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/onboard_page.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Positioned(
            top: 0.2.sw,
            left: defaultPadding.sp,
            right: defaultPadding.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zoomlion GH',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kPrimaryDark),
                ),
                SizedBox(height: defaultPadding.sp),
                Text(
                  'Let\'s Get Started',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.sp,
                        color: AppColor.kBlackColor.withOpacity(0.75),
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.55.sw,
            left: defaultPadding.sp,
            right: defaultPadding.sp,
            child: Text(
              'Enjoy Excellent Waste Management Service',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimaryDark),
            ),
          ),
          Positioned(
            bottom: 0.4.sw,
            left: defaultPadding.sp,
            right: defaultPadding.sp * 2,
            child: Text(
              'Consistent and Progressive Quality Waste Management Services have never been easier',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.kBlackColor.withOpacity(0.75),
                  ),
            ),
          ),
          Positioned(
              bottom: 0.03.sw,
              left: defaultPadding,
              right: defaultPadding,
              child: buildSignInTextBtn()),
        ],
      ),
    );
  }

  SizedBox buildSignInTextBtn() {
    return SizedBox(
      child: Column(
        children: [
          AppButton(
            btnColor: AppColor.kPrimary,
            btnLabel: 'Create Account',
            press: () => {
              debugPrint('Create Account'),
              Navigator.of(context)
                  .pushReplacementNamed(RouteGenerator.signUpScreen),
            },
          ),
          SizedBox(height: defaultPadding.sp / 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account? ',
                style: TextStyle(
                  fontSize: 16.sp,
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
                  debugPrint('Sign In'),
                  Navigator.of(context)
                      .pushReplacementNamed(RouteGenerator.loginScreen),
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.kPrimary,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
