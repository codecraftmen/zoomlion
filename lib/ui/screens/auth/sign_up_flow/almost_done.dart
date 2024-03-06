// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class SignUpAlmostDone extends StatefulWidget {
  const SignUpAlmostDone({super.key});

  @override
  State<SignUpAlmostDone> createState() => _SignUpAlmostDoneState();
}

class _SignUpAlmostDoneState extends State<SignUpAlmostDone> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late bool hasError;
  String otpCode = '5567';
  String userKeyedInOTP = '';
  @override
  void initState() {
    super.initState();
    hasError = false;
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkOTP() {
    if (otpCode == userKeyedInOTP) {
      setState(() {
        hasError = false;
      });
    } else {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 18.sp,
          splashRadius: 20.r,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Almost Done.\nSet up your Account.',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.kPrimaryDark),
                ),
                SizedBox(
                    height: MediaQuery.of(context).viewInsets.top +
                        defaultPadding.sp * 1.5),
                const AppTextField(
                  // readOnly: true,
                  hintText: 'Enter your mobile number',
                  iconColor: AppColor.kSecondary,
                  isPassword: false,
                  hasError: false,
                  titleText: 'Mobile Number',
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  textInputAction: TextInputAction.next,
                ),
                Text(
                  'You’ll use this to log in to your account.',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kBlackColor.withOpacity(0.70.sp),
                      ),
                ),
                SizedBox(height: defaultPadding.sp),
                const AppTextField(
                  // readOnly: true,
                  hintText: 'Enter a strong password',
                  iconColor: AppColor.kSecondary,
                  isPassword: true,
                  hasError: false,
                  titleText: 'Password',
                  textInputAction: TextInputAction.done,
                ),
                Text(
                  'Password must be alpha-numeric and at least 8 characters.',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kBlackColor.withOpacity(0.70.sp),
                      ),
                ),
                SizedBox(height: 0.35.sh),
                Text(
                  'By continuing you agree to Zoomlion\'s Terms and Conditions and acknowledge our Privacy Policy',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kBlackColor.withOpacity(0.70.sp),
                      ),
                ),
                SizedBox(height: defaultPadding.sp),
                AppButton(
                  btnColor: AppColor.kPrimaryDark,
                  btnLabel: 'Sign Up',
                  press: () => {
                    debugPrint('OTP Verfication'),
                    otpVerfication(context),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void otpVerfication(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isDismissible: false,
      isScrollControlled: true,
      elevation: 3,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        width: double.maxFinite.w,
        decoration: BoxDecoration(
          color: AppColor.kScaffoldColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Text(
              'Verify Your Mobile Number',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.kPrimaryDark,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'We have sent a 4-Digit  code to your mobile number',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColor.kBlackColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
              ),
              onPressed: () => {
                debugPrint('Change Number'),
                Navigator.of(context).pop(),
              },
              child: Text(
                'Change Mobile Number',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.kPrimaryDark,
                ),
              ),
            ),
            buildOTPRow(),
            SizedBox(height: defaultPadding.h * 1.5),
            const ResendCodeTimer(),
            SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom +
                    defaultPadding.sp * 1.5),
          ],
        ),
      ),
    );
  }

  SizedBox buildOTPRow() {
    return SizedBox(
      child: Column(
        children: [
          OTPRow(
            hasError: hasError,
            onChanged: () {
              setState(() {
                hasError = false;
              });
            },
            successCallback: () {
              setState(() {
                hasError = false;
              });
              debugPrint('Code Correct!');
              Navigator.of(context).pop();
              _verificationComplete(context);
              Future.delayed(
                const Duration(seconds: 3),
                () => Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.welcomeMessage),
              );
            },
            failCallback: () {
              setState(() {
                hasError = true;
              });
              debugPrint('Code InCorrect!');
            },
            oTPCode: otpCode,
            setOTPCode: (String value) => userKeyedInOTP = value,
          ),
          AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 300,
            ),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: hasError
                ? Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Your code is not valid, please input valid code.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.textError,
                            ),
                      ),
                    ],
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  _verificationComplete(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        child: Container(
          height: 405.h,
          width: 400.w,
          decoration: BoxDecoration(
              color: AppColor.kScaffoldColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.of(context)
                    .pushNamed(RouteGenerator.welcomeMessage),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.close),
                iconSize: 18.sp,
                splashRadius: 20.r,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.checkcircle,
                  ),
                  Text(
                    'Verified!',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.kPrimaryDark,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: defaultPadding.sp),
                  Text(
                    'Your mobile number has successfully \nbeen verified',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColor.kBlackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
