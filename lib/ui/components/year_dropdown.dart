import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class DateYearDropDown extends StatefulWidget {
  const DateYearDropDown({super.key});

  @override
  State<DateYearDropDown> createState() => _DateYearDropDownState();
}

class _DateYearDropDownState extends State<DateYearDropDown> {
  final List<String> _years = [
    '1974',
    '1975',
    '1976',
    '1977',
    '1978',
    '1979',
    '1980',
    '1981',
    '1982',
    '1983',
    '1984',
    '1985',
    '1986',
    '1987',
    '1988',
    '1989',
    '1990',
    '1991',
    '1992',
    '1993',
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
  ];
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 91.w,
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
        value: selectedYear,
        onChanged: (value) => setState(() {
          selectedYear = value;
        }),
        hint: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YY',
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
        items: _years
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
        selectedItemBuilder: (BuildContext context) => _years
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
