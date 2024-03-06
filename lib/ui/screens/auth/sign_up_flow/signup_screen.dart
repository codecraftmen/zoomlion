import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 18.sp,
          splashRadius: 20.r,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zoomlion GH',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kPrimaryDark),
                ),
                Text(
                  "Let's get started",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kBlackColor,
                      ),
                ),
                SizedBox(height: defaultPadding.sp * 1.5),
                Text(
                  'Sign up with your Email Address',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 13.sp,
                        color: AppColor.kBlackColor.withOpacity(0.75),
                      ),
                ),
                SizedBox(height: defaultPadding.sp),
                const AppTextField(
                  titleText: 'First Name',
                  hintText: 'Enter your first name',
                  isPassword: false,
                  hasError: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: defaultPadding.sp),
                const AppTextField(
                  titleText: 'Last Name',
                  hintText: 'Enter your last name',
                  isPassword: false,
                  hasError: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: defaultPadding.sp),
                const AppTextField(
                  titleText: 'Email',
                  hintText: 'Enter your email address',
                  isPassword: false,
                  hasError: false,
                  keyboardType: TextInputType.emailAddress,
                  assetName: 'assets/icons/checkcircle.svg',
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 0.3.sh),
                AppButton(
                  btnColor: AppColor.kPrimaryDark,
                  btnLabel: 'Get Started',
                  press: () => {
                    debugPrint('Get Started'),
                    Navigator.of(context).pushNamed(RouteGenerator.addUserInfo),
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
