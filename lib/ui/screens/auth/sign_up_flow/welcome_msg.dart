import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF8FEFC),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Good to have you here, User!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kPrimaryDark,
                  ),
            ),
            Text(
              "Your account has been created and you’re ready ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kPrimaryDark,
                  ),
            ),
            SizedBox(height: defaultPadding.sp),
            AppButton(
              btnColor: AppColor.kPrimaryDark,
              btnLabel: 'Continue',
              press: () => {
                debugPrint('Login'),
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.loginScreen),
              },
            ),
            SizedBox(height: defaultPadding.sp),

          ],
        ),
      )),
    );
  }
}
