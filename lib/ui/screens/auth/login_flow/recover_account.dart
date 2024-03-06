import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class RecoverAccountScreen extends StatefulWidget {
  const RecoverAccountScreen({super.key});

  @override
  State<RecoverAccountScreen> createState() => _RecoverAccountScreenState();
}

class _RecoverAccountScreenState extends State<RecoverAccountScreen> {
  late TextEditingController emailController;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
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
        child: Column(
          children: [
            SizedBox(height: defaultPadding.sp),
            Text(
              'Recover Your Account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kPrimaryDark),
            ),
            SizedBox(height: defaultPadding.sp),
            Text(
              'Enter the email address associated with your Zoomlion account and we’ll send account recovery instructions if we find your account.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.kBlackColor.withOpacity(0.75),
                  ),
            ),
            SizedBox(height: defaultPadding.sp * 3),
            const AppTextField(
              hintText: 'Enter your email address',
              isPassword: false,
              hasError: false,
              titleText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: defaultPadding.sp * 3),
            AppButton(
              btnLabel: 'Send Recovery Instructions',
              press: () => {
                debugPrint('Send Recovery Instructions'),
                Navigator.of(context).pushNamed(RouteGenerator.resetLink),
              },
            ),
          ],
        ),
      ),
    );
  }
}
