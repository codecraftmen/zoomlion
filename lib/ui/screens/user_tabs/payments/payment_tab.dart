// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({super.key});

  @override
  State<PaymentTab> createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.all(defaultPadding.sp),
          child: Text(
            'Payments',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.kPrimary),
          ),
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding.sp / 1.5, vertical: defaultPadding.sp),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 0.05.sh),
              payableAmount(),
              SizedBox(height: 0.1.sh),
              paymentBreakdown(),
              const Spacer(),
              AppButton(
                btnLabel: 'Make Payment',
                press: () => {
                  debugPrint('Make Payemnt'),
                  Navigator.of(context).pushNamed(RouteGenerator.paymentMethod),
                },
              ),
              SizedBox(height: defaultPadding.sp),
            ],
          ),
        ),
      ),
    );
  }

  payableAmount() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          border:
              Border.all(color: AppColor.kPlaceholderColor.withOpacity(0.8)),
          borderRadius: BorderRadius.circular(8.r)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/payment.svg',
              color: AppColor.kPrimary,
            ),
            SizedBox(width: defaultPadding.sp / 2),
            Text(
              'Amount To Pay: GHC -100.00',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPrimary),
            ),
          ],
        ),
      ),
    );
  }

  paymentBreakdown() {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding.sp, vertical: defaultPadding.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.kPlaceholderColor.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arrears',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              ),
              Text(
                'GHC 0.00',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              )
            ],
          ),
          Divider(
            color: AppColor.kPlaceholderColor.withOpacity(0.6),
            thickness: 0.5.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Amount',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              ),
              Text(
                'GHC 0.00',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              )
            ],
          ),
          Divider(
              color: AppColor.kPlaceholderColor.withOpacity(0.6),
              thickness: 0.5.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              ),
              Text(
                'GHC 0.00',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              )
            ],
          ),
          Divider(
              color: AppColor.kPlaceholderColor.withOpacity(0.6),
              thickness: 0.5.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Credit',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              ),
              Text(
                'GHC 0.00',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
