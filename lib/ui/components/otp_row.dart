import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';
import 'otp_inputfield.dart';

class OTPRow extends StatefulWidget {
  const OTPRow(
      {super.key,
      required this.hasError,
      required this.onChanged,
      required this.successCallback,
      required this.failCallback,
      required this.setOTPCode,
      required this.oTPCode,
      this.activeColor = AppColor.kPrimaryDark});
  final bool hasError;
  final Function() onChanged;
  final Function() successCallback;
  final Function() failCallback;
  final Function(String) setOTPCode;
  final String oTPCode;
  final Color activeColor;

  @override
  State<OTPRow> createState() => _OTPRowState();
}

class _OTPRowState extends State<OTPRow> {
  late TextEditingController otp1;
  late TextEditingController otp2;
  late TextEditingController otp3;
  late TextEditingController otp4;
  late FocusNode otp1Node;
  late FocusNode otp2Node;
  late FocusNode otp3Node;
  late FocusNode otp4Node;

  @override
  void initState() {
    otp1 = TextEditingController();
    otp1Node = FocusNode();
    otp2 = TextEditingController();
    otp2Node = FocusNode();
    otp3 = TextEditingController();
    otp3Node = FocusNode();
    otp4 = TextEditingController();
    otp4Node = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp1Node.dispose();
    otp2Node.dispose();
    otp3Node.dispose();
    otp4Node.dispose();
    super.dispose();
  }

  void Function()? checkOTPCode() {
    String text1 = otp1.text;
    String text2 = otp2.text;
    String text3 = otp3.text;
    String text4 = otp4.text;

    FocusScope.of(context).unfocus();

    if ('$text1$text2$text3$text4' == widget.oTPCode) {
      widget.successCallback();
    } else {
      widget.failCallback();
    }
    return null;
  }

  void Function()? updateOTP() {
    String text1 = otp1.text;
    String text2 = otp2.text;
    String text3 = otp3.text;
    String text4 = otp4.text;
    widget.setOTPCode('$text1$text2$text3$text4');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTPInputField(
            activeColor: widget.activeColor,
            controller: otp1,
            currentFocusNode: otp1Node,
            nextFocusNode: otp2Node,
            hasError: widget.hasError,
            onChanged: () {
              updateOTP();
              widget.onChanged();
            },
          ),
          OTPInputField(
            activeColor: widget.activeColor,
            controller: otp2,
            previousFocusNode: otp1Node,
            currentFocusNode: otp2Node,
            nextFocusNode: otp3Node,
            hasError: widget.hasError,
            onChanged: () {
              updateOTP();
              widget.onChanged();
            },
          ),
          OTPInputField(
            activeColor: widget.activeColor,
            controller: otp3,
            previousFocusNode: otp2Node,
            currentFocusNode: otp3Node,
            nextFocusNode: otp4Node,
            hasError: widget.hasError,
            onChanged: () {
              updateOTP();
              widget.onChanged();
            },
          ),
          OTPInputField(
            activeColor: widget.activeColor,
            controller: otp4,
            previousFocusNode: otp3Node,
            currentFocusNode: otp4Node,
            hasError: widget.hasError,
            onSubmitted: (_) => checkOTPCode(),
            textInputAction: TextInputAction.done,
            onChanged: () {
              updateOTP();
              widget.onChanged();
            },
          ),
        ],
      ),
    );
  }
}
