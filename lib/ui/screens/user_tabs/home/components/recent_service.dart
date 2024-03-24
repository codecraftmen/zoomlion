import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../models/app_model.dart';
import '../../../../../theme/app_style.dart';
import '../../../../components/app_widgets.dart';

final List<HomeService> services = [
  HomeService(
    serviceName: 'My Bins',
    serviceDesc:
        'Lorem ipsum dolor sit amet, conset non adipiscing elit, sed do eiusmo ...',
    serviceTime: '3 days',
    serviceType: 'Service Type',
    isActive: true,
    serviceIcon: 'assets/icons/bin.svg',
  ),
  HomeService(
      serviceName: 'Bin PickUp History',
      serviceDesc:
          'Lorem ipsum dolor sit amet, conset non adipiscing elit, sed do eiusmo ...',
      serviceTime: '3 days',
      serviceType: 'Service Type',
      serviceIcon: 'assets/icons/recent.svg',
      serviceIconBg: AppColor.kPrimary,
      serviceIconColor: AppColor.kWhiteColor),
];

class HomeRecentService extends StatelessWidget {
  const HomeRecentService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding.sp / 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Bin Service',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              GestureDetector(
                onTap: () => {debugPrint('See More')},
                child: Text(
                  'See more >  ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color.fromARGB(255, 81, 90, 106),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 265.h,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  services.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(
                            left: defaultPadding.sp / 1.5,
                            right: defaultPadding.sp / 1.5),
                        child: RecentServiceCard(
                          service: services[index],
                        ),
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
