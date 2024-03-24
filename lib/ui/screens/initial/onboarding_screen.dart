// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes.dart';
import '../../../theme/app_style.dart';

final List<Onboard> onboard_data = [
  Onboard(
    image: 'assets/images/onboarding screen_1.png',
    title: 'Enjoy Excellent Waste Management Service',
    description:
        'Consistent and Progressive Quality Waste Management Services have never been easier',
    color: AppColor.kPrimaryDark,
  ),
  Onboard(
    image: 'assets/images/onboarding screen_2.png',
    title: 'Request For A Bin',
    description:
        'We have durable bins you can request for, proper disposal of waste',
    color: AppColor.kPrimaryDark,
  ),
  Onboard(
    image: 'assets/images/onboarding screen_3.png',
    title: 'Help Keep Ghana Clean',
    description: 'Do your part to help remove filth from our communities',
    color: AppColor.kPrimaryDark,
  ),
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void chooseColor(color) async {
    if (_pageIndex == 0) {
      color = AppColor.kPrimary;
    } else if (_pageIndex == 1) {
      color = AppColor.kSecondary;
    } else {
      color = AppColor.kSecondaryAlt;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboard_data.length,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: ((context, index) => OnBoardContent(
                  image: onboard_data[index].image,
                  title: onboard_data[index].title,
                  description: onboard_data[index].description,
                  color: onboard_data[index].color,
                )),
          ),
          Positioned(
            bottom: 0.5.sw,
            left: defaultPadding,
            child: Row(
              children: [
                ...List.generate(
                  onboard_data.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                      color: AppColor.kPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.08.sw,
            left: defaultPadding / 10,
            right: defaultPadding,
            child: Row(
              children: [
                TextButton(
                  onPressed: () => {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.welcomeScreen)
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kPrimary,
                        ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 40.h,
                  child: TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      if (_pageIndex < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.welcomeScreen);
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          'Next ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kPrimary),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.sp,
                          color: AppColor.kPrimary,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    required this.color,
  });

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: isActive ? 25.w : 8.5.w,
      decoration: BoxDecoration(
        color: isActive ? color : color.withOpacity(0.3),
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;
  final Color color;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
    required this.color,
  });
}

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.color,
  });

  final String image, title, description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(image),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Positioned(
          bottom: 0.76.sw,
          left: defaultPadding.sp,
          right: defaultPadding.sp,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.kPrimary),
          ),
        ),
        Positioned(
          bottom: 0.55.sw,
          left: defaultPadding.sp,
          right: defaultPadding.sp * 2,
          child: Text(
            description,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17.sp,
                  color: AppColor.kPrimaryDark,
                ),
          ),
        ),
      ],
    );
  }
}
