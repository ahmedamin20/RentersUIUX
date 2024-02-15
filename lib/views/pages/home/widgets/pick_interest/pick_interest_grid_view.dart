import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/componants/genral_brand_list_view_item.dart';

class PickInterestGridView extends StatelessWidget {
  const PickInterestGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
          childAspectRatio: 3.5 / 2.3,
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          children: List.generate(10, (index) {
            return const GenralBrandListItem();
          })),
    );
  }
}
