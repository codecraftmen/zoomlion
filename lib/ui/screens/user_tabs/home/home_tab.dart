import 'package:flutter/material.dart';

import '../../../../theme/app_style.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Home Tab'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
