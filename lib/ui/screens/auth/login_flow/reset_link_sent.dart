import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';

class ResetLinkScreen extends StatefulWidget {
  const ResetLinkScreen({super.key});

  @override
  State<ResetLinkScreen> createState() => _ResetLinkScreenState();
}

class _ResetLinkScreenState extends State<ResetLinkScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushNamed(RouteGenerator.resetPassword),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 24.h,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.close),
          iconSize: 18,
          splashRadius: 22.r,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: defaultPadding.sp,
            right: defaultPadding.sp,
            top: defaultPadding.sp),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                AppImages.mail,
                width: 235.w,
                height: 234.91.h,
              ),
            ),
            Text(
              'Check your Email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimaryDark),
            ),
            SizedBox(height: defaultPadding.sp),
            Text(
              'We just sent you an email with a instructions to change your mobile number and recover your account.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.kBlackColor.withOpacity(0.75),
                  ),
            ),
            const Spacer(),
            Text(
              'Did not receive the email?',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.kBlackColor.withOpacity(0.75),
              ),
            ),
            buildResetLinkTextBtn(),
            SizedBox(
              height: 0.5.sp,
            ),
            SizedBox(height: defaultPadding.sp),
          ],
        ),
      ),
    );
  }

  SizedBox buildResetLinkTextBtn() {
    return SizedBox(
      height: 16.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Check your spam folder, or',
            style: TextStyle(
              fontSize: 13.sp,
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
              debugPrint('Request a new link sent!'),
              // Navigator.of(context)
              //     .pushReplacementNamed(RouteGenerator.userSignUp),
            },
            child: Text(
              ' request a new link.',
              style: TextStyle(
                fontSize: 13.sp,
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
