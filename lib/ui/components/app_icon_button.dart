// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_style.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      this.btnColor = AppColor.kGreyColor,
      this.iconColor = AppColor.kPrimary,
      this.labelColor = AppColor.kInterHeaderColor,
      required this.btnLabel,
      required this.btnIcon,
      this.press});
  final Color? btnColor;
  final Color? iconColor;
  final Color? labelColor;
  final String btnLabel;
  final String btnIcon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: double.maxFinite.w,
      child: TextButton(
        onPressed: press as void Function()?,
        style: TextButton.styleFrom(
          backgroundColor: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              btnIcon,
              color: iconColor,
            ),
            SizedBox(width: defaultPadding.sp),
            Text(
              btnLabel,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: labelColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
