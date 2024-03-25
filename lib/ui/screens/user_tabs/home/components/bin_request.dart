import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoomlion/theme/app_style.dart';

class BinRequest extends StatefulWidget {
  const BinRequest({super.key});

  @override
  State<BinRequest> createState() => _BinRequestState();
}

class _BinRequestState extends State<BinRequest> {
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
        centerTitle: true,
        title: const Text('Bin Request'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
