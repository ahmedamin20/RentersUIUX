import 'package:flutter/material.dart';

import 'package:ksb/views/pages/car_list/widgets/car_list_app_bar.dart';
import 'package:ksb/views/pages/car_list/widgets/car_view_body.dart';

class CarsView extends StatelessWidget {
  const CarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const
    Scaffold(
      // appBar: CarListAppBar(),
      body: CarViewBody(),
    );
  }
}
