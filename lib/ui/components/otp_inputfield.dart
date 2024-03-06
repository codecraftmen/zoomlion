import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class OTPInputField extends StatefulWidget {
  const OTPInputField(
      {super.key,
      required this.controller,
      this.nextFocusNode,
      this.previousFocusNode,
      this.currentFocusNode,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = const TextInputType.numberWithOptions(signed: true),
      this.onSubmitted,
      required this.onChanged,
      this.hasError = false,
      this.activeColor = AppColor.kPrimaryDark});
  final TextEditingController controller;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final FocusNode? currentFocusNode;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onSubmitted;
  final Function() onChanged;
  final bool hasError;
  final Color activeColor;

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late bool filled;
  @override
  void initState() {
    filled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: TextField(
        controller: widget.controller,
        focusNode: widget.currentFocusNode,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        onSubmitted: widget.onSubmitted,
        maxLength: 1,
        textAlign: TextAlign.center,
        showCursor: false,
        style: widget.hasError
            ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.textError,
                )
            : Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: widget.activeColor,
                ),
        onChanged: (String text) {
          widget.onChanged();
          if (text != '') {
            setState(() {
              filled = true;
            });
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            setState(() {
              filled = false;
            });
            FocusScope.of(context).requestFocus(widget.previousFocusNode);
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(
              color: widget.activeColor,
            ),
          ),
          enabledBorder: filled
              ? widget.hasError
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.textError,
                      ),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.activeColor,
                      ),
                    )
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.kBlackColor.withOpacity(0.05),
                  ),
                ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.activeColor,
            ),
          ),
          counterText: '',
          filled: true,
          fillColor: AppColor.kBlackColor.withOpacity(0.05),
          isDense: true,
        ),
      ),
    );
  }
}
