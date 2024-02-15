import 'package:flutter/material.dart';

import 'package:ksb/views/pages/home/widgets/pick_interest/custom_pick_interest_app_bar.dart';
import 'package:ksb/views/pages/home/widgets/pick_interest/pick_interest_view_body.dart';

class PickInterestView extends StatelessWidget {
  const PickInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomPickInterestAppBar(),
      body: PickInterestViewBody(),
    );
  }
}
