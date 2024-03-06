import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes.dart';
import '../../../../theme/app_style.dart';
import '../../../components/app_widgets.dart';

// import '../../../../routes.dart';

class UserPersonalInfo extends StatefulWidget {
  const UserPersonalInfo({super.key});

  @override
  State<UserPersonalInfo> createState() => _UserPersonalInfoState();
}

class _UserPersonalInfoState extends State<UserPersonalInfo> {
  int selectedGender = 0;
  late TextEditingController postLocationController;
  bool hasError = false;
  @override
  void initState() {
    super.initState();
    postLocationController = TextEditingController();
  }

  @override
  void dispose() {
    postLocationController.dispose();
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
                  'Hello User,',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kPrimaryDark),
                ),
                Text(
                  "Lets continue to get to know you more",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kBlackColor,
                      ),
                ),
                SizedBox(height: defaultPadding.sp * 2),
                Text(
                  "Gender",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kBlackColor.withOpacity(0.70.sp),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 91.w,
                      child: GenderBtn(
                        btnLabel: 'Female',
                        isActive: selectedGender == 1,
                        onTap: () => setState(() {
                          selectedGender = 1;
                          debugPrint('Female');
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 91.w,
                      child: GenderBtn(
                        btnLabel: 'Male',
                        isActive: selectedGender == 2,
                        onTap: () => setState(() {
                          selectedGender = 2;
                          debugPrint('Male');
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 127.w,
                      child: GenderBtn(
                        btnLabel: 'Prefer not to say',
                        isActive: selectedGender == 3,
                        onTap: () => setState(() {
                          selectedGender = 3;
                          debugPrint('Prefer not to say');
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultPadding.sp),
                Text(
                  "Date of Birth",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kBlackColor.withOpacity(0.70.sp),
                      ),
                ),
                SizedBox(height: defaultPadding.sp / 2),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateMonthDropDown(),
                    DateDayDropDown(),
                    DateYearDropDown(),
                  ],
                ),
                SizedBox(height: defaultPadding.sp * 1.5),
                const AppTextField(
                  titleText: 'Where do you live?',
                  hintText: 'Start typing your town or state...',
                  isPassword: false,
                  hasError: false,
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 0.31.sh),
                AppButton(
                  btnColor: AppColor.kPrimaryDark,
                  btnLabel: 'Next',
                  press: () => {
                    debugPrint('Next'),
                    Navigator.of(context).pushNamed(RouteGenerator.almostDone),
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
