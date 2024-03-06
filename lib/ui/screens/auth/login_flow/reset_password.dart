import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultPadding.sp * 2),
              Text(
                'Reset Password',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kPrimaryDark),
              ),
              SizedBox(height: defaultPadding.sp),
              Text(
                'Choose a strong password that is different from any password you’ve used before.',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.kBlackColor.withOpacity(0.75),
                    ),
              ),
              SizedBox(height: defaultPadding.sp * 2),
              const AppTextField(
                hintText: 'Type a strong password',
                isPassword: true,
                hasError: false,
                titleText: 'New Password',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: defaultPadding.sp),
              const AppTextField(
                hintText: 'Type password again',
                isPassword: true,
                hasError: false,
                titleText: 'Confirm Password',
                assetName: 'assets/icons/checkcircle.svg',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: defaultPadding.sp * 3),
              AppButton(
                btnLabel: 'Reset Password',
                press: () => {
                  debugPrint('Reset Password'),
                  _verificationComplete(context),
                },
              ),
            ],
          ),
        ),
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
          height: 380.h,
          width: 380.w,
          decoration: BoxDecoration(
              color: AppColor.kScaffoldColor,
              borderRadius: BorderRadius.circular(30.r)),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteGenerator.loginScreen),
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
                    'Password Reset!',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.kPrimaryDark,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: defaultPadding.sp),
                  Text(
                    'You are being redirected to the log in page...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColor.kBlackColor,
                        fontSize: 13.sp,
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
