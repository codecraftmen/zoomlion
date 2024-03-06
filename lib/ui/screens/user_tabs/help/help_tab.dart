import 'package:flutter/material.dart';

import '../../../../theme/app_style.dart';

class HelpTab extends StatelessWidget {
  const HelpTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Help Tab'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
