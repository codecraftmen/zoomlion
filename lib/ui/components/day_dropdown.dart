import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

class DateDayDropDown extends StatefulWidget {
  const DateDayDropDown({super.key});

  @override
  State<DateDayDropDown> createState() => _DateDayDropDownState();
}

class _DateDayDropDownState extends State<DateDayDropDown> {
  final List<String> _days = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];
  String? selectedDay;
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
        value: selectedDay,
        onChanged: (value) => setState(() {
          selectedDay = value;
        }),
        hint: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DD',
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
        items: _days
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
        selectedItemBuilder: (BuildContext context) => _days
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
