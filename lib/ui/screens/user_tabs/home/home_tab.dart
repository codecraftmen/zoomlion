import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';
import 'components/recent_service.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.h),
        child: AppBar(
          // backgroundColor: AppColor.kGreyColor,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding.sp, vertical: defaultPadding.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi, User',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => {debugPrint('Notification!!')},
                        icon: SvgPicture.asset(
                          'assets/icons/bell-notification.svg',
                          width: 28.sp,
                          height: 28.sp,
                        ),
                      ),
                      Container(
                        width: 46.w,
                        height: 46.h,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1696266262379-1f3b5cbaf114?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => {debugPrint('verify your account')},
                        child: DottedBorder(
                          color: AppColor.kSecondary,
                          borderType: BorderType.RRect,
                          strokeWidth: 1.5.w,
                          radius: Radius.circular(32.r),
                          dashPattern: const [3, 2],
                          child: Container(
                            width: 0.47.sw,
                            height: 38.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding.sp / 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/icons/check_mark.svg',
                                    width: 20.sp, height: 20.sp),
                                Text(
                                  'Verify your account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColor.kSecondary,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => {debugPrint('Bin Request')},
                        child: Container(
                          width: 0.35.sw,
                          height: 40.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding.sp / 2),
                          decoration: BoxDecoration(
                              color: AppColor.kGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(32.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/bin.svg',
                                width: 28.sp,
                                height: 28.sp,
                              ),
                              Text(
                                'Bin Request',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: AppColor.kBlackColor, thickness: 0.5.sp),
            confirmEmailCard(),
            const HomeRecentService(),
            faqCard(),
            serviceRequestCard(),
          ],
        ),
      ),
    );
  }

  confirmEmailCard() {
    return Padding(
      padding: EdgeInsets.only(
          left: defaultPadding.sp / 1.5,
          right: defaultPadding.sp / 1.5,
          top: defaultPadding.sp / 2,
          bottom: defaultPadding.sp),
      child: Container(
        height: 130.h,
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding.sp, vertical: defaultPadding.sp),
        decoration: BoxDecoration(
            color: AppColor.kSecondaryAlt.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColor.kSecondaryAlt)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColor.kSecondaryAlt.withOpacity(0.4),
              child: Center(
                child: Icon(
                  Icons.mail_outline_rounded,
                  size: 20.sp,
                  color: AppColor.kSecondaryAlt,
                ),
              ),
            ),
            SizedBox(width: defaultPadding.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Confirm your email address',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.kSecondaryAlt),
                ),
                Text(
                  'We\'ll send a verification code to confirm\nyour email address',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.kSecondaryAlt),
                ),
                GestureDetector(
                  onTap: () => {debugPrint('Send Link')},
                  child: Text(
                    'Send verification link  >',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kSecondaryAlt),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  faqCard() {
    return GestureDetector(
      onTap: () => {debugPrint('FAQs...............')},
      child: Container(
        height: 145.h,
        width: double.maxFinite.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/faq.png'),
                fit: BoxFit.contain)),
      ),
    );
  }

  serviceRequestCard() {
    return Container(
      height: 284.h,
      margin: EdgeInsets.only(
          left: defaultPadding.sp / 1.5,
          right: defaultPadding.sp / 1.5,
          bottom: defaultPadding.sp * 2),
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding.sp, vertical: defaultPadding.sp * 1.5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.kGreyColor, width: 1.sp),
          borderRadius: BorderRadius.circular(8.r)),
      child: Column(
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: ShapeDecoration(
                shape: const OvalBorder(),
                color: AppColor.kPlaceholderColor.withOpacity(0.3)),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/paper.svg',
                width: 34.w,
                height: 40.h,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(height: defaultPadding.sp),
          SizedBox(
            height: 60.h,
            width: 311.w,
            child: Text(
              'Lorem ipsum dolor sit amet, conset non adipiscing elit, sed do eiusmo  ipsum dolor sit amet, conset non adipiscing elit',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.kInterHeaderColor,
                  ),
            ),
          ),
          SizedBox(height: defaultPadding.sp),
          AppIconButton(
            btnIcon: 'assets/icons/settings.svg',
            btnLabel: 'Service Request',
            btnColor: AppColor.kPlaceholderColor.withOpacity(0.25),
            press: () => {debugPrint('Service Request')},
          )
        ],
      ),
    );
  }
}
