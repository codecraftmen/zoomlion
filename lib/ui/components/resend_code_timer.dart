import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class ResendCodeTimer extends StatefulWidget {
  const ResendCodeTimer({super.key});

  @override
  State<ResendCodeTimer> createState() => _ResendCodeTimerState();
}

class _ResendCodeTimerState extends State<ResendCodeTimer> {
  late int count;
  late Timer counter;
  @override
  void initState() {
    count = 60;
    counter = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (count == 0) {
          count = 60;
        }
        setState(() {
          count--;
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    counter.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Request for a new code in: ',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: const Color(0xff2a353f),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          '00.$count',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColor.kSecondaryAlt,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
        )
      ],
    );
  }
}
