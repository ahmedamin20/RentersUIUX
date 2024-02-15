import 'package:flutter/material.dart';

import 'component/build_listview_inprogress_item.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (builder, context) =>
              const BuildListViewInProgressItem(),
          separatorBuilder: (builder, context) => const SizedBox(),
          itemCount: 5),
    );
  }
}
