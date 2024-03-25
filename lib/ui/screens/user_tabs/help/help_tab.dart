import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/app_style.dart';

class HelpTab extends StatelessWidget {
  const HelpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
          child: Text(
            'Help',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.kInterHeaderColor),
          ),
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
