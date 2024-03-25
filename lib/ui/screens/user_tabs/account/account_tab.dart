import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/app_style.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp / 1.5),
          child: Text(
            'Account',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.kInterHeaderColor,
                ),
          ),
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding.sp / 1.5, vertical: defaultPadding.sp),
          child: Column(
            children: [
              headerCard(),
              SizedBox(height: defaultPadding.sp),
              profileSection(),
              SizedBox(height: defaultPadding.sp),
              inviteFriendsSection(),
              SizedBox(height: defaultPadding.sp),
              accountSettingSection(),
              SizedBox(height: defaultPadding.sp),
              aboutSection(),
            ],
          ),
        ),
      ),
    );
  }

  headerCard() {
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 136.h,
        width: double.maxFinite.w,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding.sp, vertical: defaultPadding.sp / 2),
          child: Column(
            children: [
              Row(
                children: [
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
                  SizedBox(width: defaultPadding.sp),
                  Text(
                    'User Name',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: defaultPadding.sp / 2),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 24.h,
                    width: 54.w,
                    decoration: BoxDecoration(
                        color: AppColor.kPrimary.withOpacity(0.2),
                        border: Border.all(
                            color: AppColor.kPrimary.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(32.r)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.watch_later,
                              size: 16.sp, color: AppColor.kPrimary),
                          SizedBox(width: 3.sp),
                          Text(
                            '150',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColor.kPrimary, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  profileSection() {
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 112.h,
        width: double.maxFinite.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Submitted Application',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  inviteFriendsSection() {
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 56.h,
        width: double.maxFinite.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Invite Friends',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  accountSettingSection() {
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 112.h,
        width: double.maxFinite.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  aboutSection() {
    return Material(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: SizedBox(
        height: 290.h,
        width: double.maxFinite.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About Zoomlion',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FAQs',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Terms & Conditions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
              Divider(
                  color: AppColor.kPlaceholderColor.withOpacity(0.6),
                  thickness: 0.5.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Log Out',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    onPressed: () => {debugPrint('active')},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColor.kGreyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
