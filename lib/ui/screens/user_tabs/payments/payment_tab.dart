import 'package:flutter/material.dart';

import '../../../../theme/app_style.dart';

class PaymentTab extends StatelessWidget {
  const PaymentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Payment Tab'),
      ),
      backgroundColor: AppColor.kScaffoldColor,
    );
  }
}
