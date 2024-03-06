
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_style.dart';

class AppTheme {
  BuildContext context;
  AppTheme(this.context);

  final String _defaultFont = 'Manrope';

  ThemeData initTheme() {
    return ThemeData(
      primaryColor: AppColor.kPrimary,
      scaffoldBackgroundColor: AppColor.kWhiteColor,
      fontFamily: _defaultFont,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleSpacing: defaultPadding / 4,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontFamily: _defaultFont,
              fontSize: 20.sp,
              color: AppColor.kPrimaryDark,
            ),
        iconTheme: IconThemeData(
          color: AppColor.kPrimaryDark,
          size: 22.sp,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.kPrimary,
          minimumSize: Size(double.infinity.w, 63.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColor.kPrimaryDark),
      ),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        padding: EdgeInsets.all(16.sp),
      ),
    );
  }
}