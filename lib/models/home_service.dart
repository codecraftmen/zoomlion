import 'package:flutter/material.dart';

import '../theme/app_style.dart';

class HomeService {
  final String serviceName;
  final String serviceDesc;
  final String serviceTime;
  final String serviceType;
  bool serviceLiked;
  bool isActive = false;
  String serviceIcon;
  Color serviceIconColor;
  Color serviceIconBg;

  HomeService({
    required this.serviceName,
    required this.serviceDesc,
    required this.serviceTime,
    required this.serviceType,
    this.serviceLiked = false,
    this.isActive = false,
    this.serviceIcon = 'assets/icons/null.svg',
    this.serviceIconBg = Colors.transparent,
    this.serviceIconColor = AppColor.kPrimary,
  });
}
