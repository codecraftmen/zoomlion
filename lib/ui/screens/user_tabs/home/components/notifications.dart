import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_style.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50.w,
        leading: IconButton(
          onPressed: () => {
            Navigator.of(context).pop(),
          },
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18.sp,
          splashRadius: 20.r,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Notification'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
