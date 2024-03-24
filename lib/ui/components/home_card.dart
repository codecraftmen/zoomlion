// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/app_model.dart';
import '../../theme/app_style.dart';

class RecentServiceCard extends StatefulWidget {
  const RecentServiceCard({super.key, required this.service});
  final HomeService service;

  @override
  State<RecentServiceCard> createState() => _RecentServiceCardState();
}

class _RecentServiceCardState extends State<RecentServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 244.h,
        width: 280.w,
        child: Padding(
          padding: EdgeInsets.only(
              left: defaultPadding.sp,
              top: defaultPadding.sp,
              bottom: defaultPadding.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                        color: widget.service.serviceIconBg,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.kPrimary)),
                    child: Center(
                      child: SvgPicture.asset(
                        widget.service.serviceIcon,
                        color: widget.service.serviceIconColor,
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                  ),
                  IconButton(
                    splashRadius: 20.r,
                    padding: EdgeInsets.zero,
                    color: widget.service.serviceLiked
                        ? AppColor.textError.withOpacity(0.7)
                        : AppColor.kInterHeaderColor,
                    onPressed: () => setState(() {
                      widget.service.serviceLiked =
                          !widget.service.serviceLiked;
                    }),
                    icon: widget.service.serviceLiked
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  )
                ],
              ),
              Text(
                widget.service.serviceName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 240.w,
                height: 60.h,
                child: Text(
                  widget.service.serviceDesc,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.service.serviceTime} ago',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kPlaceholderColor,
                        ),
                  ),
                  SizedBox(width: defaultPadding.sp / 2),
                  Icon(Icons.fiber_manual_record,
                      size: 7.sp, color: AppColor.kPlaceholderColor),
                ],
              ),
              Container(
                width: 95.w,
                height: 24.h,
                padding:
                    EdgeInsets.symmetric(horizontal: defaultPadding.sp / 2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.service.isActive
                        ? AppColor.kGreenColor.withOpacity(0.5)
                        : AppColor.kSecondaryAlt.withOpacity(0.5),
                  ),
                  color: widget.service.isActive
                      ? AppColor.kGreenColor.withOpacity(0.1)
                      : AppColor.kSecondaryAlt.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Center(
                  child: Text(
                    widget.service.serviceType,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 12.sp,
                          color: widget.service.isActive
                              ? AppColor.kSecondary
                              : AppColor.kSecondaryAlt,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
