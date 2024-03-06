// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.assetName = 'assets/icons/null.svg',
    this.iconColor = AppColor.kPlaceholderColor,
    required this.hintText,
    required this.isPassword,
    required this.hasError,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.onSaved,
    this.onTap,
    this.controller,
    required this.titleText,
    this.readOnly = false,
    this.maxLength,
  });
  final String titleText;
  final String? assetName;
  final String hintText;
  final bool isPassword;
  final bool hasError;
  final bool readOnly;
  final Color? iconColor;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function(String)? onSaved;
  final Function()? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.kPrimaryDark,
              ),
        ),
        SizedBox(height: defaultPadding.sp / 5),
        Stack(
          children: [
            TextField(
              maxLength: maxLength,
              readOnly: readOnly,
              obscureText: isPassword,
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              cursorColor: AppColor.kPlaceholderColor,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 15.sp,
                    color: AppColor.kBlackColor,
                  ),
              decoration: InputDecoration(
                counter: const Offstage(),
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColor.kPlaceholderColor),
                filled: true,
                fillColor: AppColor.kBlackColor.withOpacity(0.05),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: AppColor.kBlackColor.withOpacity(0.05),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: hasError
                        ? AppColor.textError
                        : AppColor.kBlackColor.withOpacity(0.05),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.kPlaceholderColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.textError,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 12.w,
              child: GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  assetName!,
                  width: 24.sp,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
