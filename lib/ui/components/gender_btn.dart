import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class GenderBtn extends StatelessWidget {
  const GenderBtn(
      {super.key,
      required this.btnLabel,
      required this.isActive,
      required this.onTap});
  final String btnLabel;
  final bool isActive;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPadding.sp),
        child: AnimatedContainer(
          height: 44.h,
          width: double.maxFinite,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.all(defaultPadding.sp / 2),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xffFFF4E1)
                : AppColor.kBlackColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: isActive ? AppColor.kSecondaryAlt : Colors.transparent,
              width: 1.sp,
            ),
          ),
          child: Text(
            btnLabel,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColor.kBlackColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
