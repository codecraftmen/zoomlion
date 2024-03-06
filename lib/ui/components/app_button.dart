import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.btnColor = AppColor.kPrimary,
    this.labelColor = AppColor.kWhiteColor,
    required this.btnLabel,
    this.press,
  });
  final Color? btnColor;
  final Color? labelColor;
  final String btnLabel;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 48.h,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: labelColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: btnColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          btnLabel,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: labelColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
        ),
      ),
    );
  }
}
