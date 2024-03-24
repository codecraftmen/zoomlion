import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/app_style.dart';
import '../../../../components/app_widgets.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({super.key});

  @override
  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
        ),
        centerTitle: true,
        title: Text(
          'Make Payment',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppButton(
                btnLabel: 'Submit Payment',
                press: () => {
                  debugPrint('Make Payemnt'),
                  // Navigator.of(context).pushNamed(RouteGenerator.makePayment),
                },
              ),
              SizedBox(height: defaultPadding.sp),
            ],
          ),
        ),
      ),
    );
  }
}
