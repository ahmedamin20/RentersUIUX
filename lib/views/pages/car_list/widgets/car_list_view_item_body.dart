import 'package:flutter/material.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

import '../../../../core/constants.dart';

class CarListItemBody extends StatelessWidget {
  const CarListItemBody({
    super.key,
    required this.title,
    required this.price
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyleManager.textStyle12w700
                .copyWith(color:LayoutCubit.get(context).isDark? ColorsManager.white:ColorsManager.grayDark),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "$price $curreny",
            style: TextStyleManager.textStyle12w500
                .copyWith(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.primaryColor),
          ),
        ],
      ),
    );
  }
}
