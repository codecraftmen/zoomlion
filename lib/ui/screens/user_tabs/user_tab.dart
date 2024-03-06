// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/app_style.dart';
import 'account/account_tab.dart';
import 'help/help_tab.dart';
import 'home/home_tab.dart';
import 'payments/payment_tab.dart';

final List<Widget> pages = [
  const HomeTab(),
  const PaymentTab(),
  const HelpTab(),
  const AccountTab(),
];

class UserTabs extends StatefulWidget {
  const UserTabs({super.key, this.tab = 0});
  final int tab;

  @override
  State<UserTabs> createState() => _UserTabsState();
}

class _UserTabsState extends State<UserTabs> {
  late int tabIndex;
  @override
  void initState() {
    tabIndex = widget.tab;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavBar,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: pages.elementAt(tabIndex),
      ),
    );
  }

  Widget get bottomNavBar {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(5.r),
        topLeft: Radius.circular(5.r),
      ),
      child: BottomNavigationBar(
        iconSize: 22.sp,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: tabIndex,
        elevation: 10,
        onTap: (index) {
          setState(() {
            tabIndex = index;
          });
        },
        selectedItemColor: AppColor.kPrimary,
        showSelectedLabels: true,
        selectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontSize: 11.sp, color: AppColor.kPrimary),
        unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 11.sp, color: const Color(0xff5f686f).withOpacity(0.7)),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: AppColor.kPrimary,
              width: 22.w,
            ),
            label: 'Home',
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 22.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/payment.svg',
              color: AppColor.kPrimary,
              width: 22.w,
            ),
            label: 'Payment',
            icon: SvgPicture.asset(
              'assets/icons/payment.svg',
              width: 22.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/chat.svg',
              color: AppColor.kPrimary,
              width: 22.w,
            ),
            label: 'Help',
            icon: SvgPicture.asset(
              'assets/icons/chat.svg',
              width: 22.w,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/account.svg',
              color: AppColor.kPrimary,
              width: 22.w,
            ),
            label: 'Account',
            icon: SvgPicture.asset(
              'assets/icons/account.svg',
              width: 22.w,
            ),
          ),
        ],
      ),
    );
  }
}
