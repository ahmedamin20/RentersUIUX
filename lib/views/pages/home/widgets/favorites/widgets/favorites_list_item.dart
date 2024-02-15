import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/services/app_router.dart';

import 'favorites_list_view_footer.dart';
import 'favorites_list_view_item_body.dart';
import 'favorites_list_view_item_header.dart';

class CustomCardCar extends StatelessWidget {
  const CustomCardCar({super.key, required this.function});
  final Function function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: ColorsManager.inputColor,
          borderRadius: BorderRadius.circular(RadiusManager.r16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FavoritesListViewItemHeader(),
            SpaceManager.sizedBox16h(context),
            const FavoritesListViewItemBody(),
            SpaceManager.sizedBox12h(context),
            const Divider(
              color: ColorsManager.graySimiDark,
            ),
            SpaceManager.sizedBox16h(context),
            const FavoritesListViewItemFooter(),
          ],
        ),
      ),
    );
  }
}
