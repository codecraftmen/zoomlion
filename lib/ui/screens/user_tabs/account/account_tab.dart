import 'package:flutter/material.dart';

import '../../../../theme/app_style.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Account Tab'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
