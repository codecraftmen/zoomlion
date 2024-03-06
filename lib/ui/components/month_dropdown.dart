import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class DateMonthDropDown extends StatefulWidget {
  const DateMonthDropDown({super.key});

  @override
  State<DateMonthDropDown> createState() => _DateMonthDropDownState();
}

class _DateMonthDropDownState extends State<DateMonthDropDown> {
  final List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 98.w,
      decoration: BoxDecoration(
        color: AppColor.kBlackColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: AppColor.kBlackColor.withOpacity(0.4),
          width: 1.sp,
        ),
      ),
      child: DropdownButton<String>(
        underline: Container(),
        dropdownColor: const Color(0xfff2f4f5),
        icon: Container(),
        isExpanded: true,
        value: selectedMonth,
        onChanged: (value) => setState(() {
          selectedMonth = value;
        }),
        hint: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MM',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColor.kBlackColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColor.kBlackColor,
              ),
            ],
          ),
        ),
        items: _months
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      e,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColor.kBlackColor, fontSize: 13.sp),
                    ),
                  ),
                ))
            .toList(),
        selectedItemBuilder: (BuildContext context) => _months
            .map((e) => Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        e,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: AppColor.kBlackColor, fontSize: 13.sp),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.kBlackColor,
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
