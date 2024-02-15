import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/genral_brand_list_view_item.dart';

class FilterListViewWithHeader extends StatelessWidget {
  final String headerText, buttonText;
  final Function() onPress;
  const FilterListViewWithHeader({
    super.key,
    required this.headerText,
    required this.buttonText,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headerText,
              style: TextStyleManager.textStyle16w700.copyWith(
                color: ColorsManager.grayDark,
              ),
            ),
            TextButton(
              onPressed: onPress,
              child: Text(
                buttonText,
                style: TextStyleManager.textStyle14w500.copyWith(
                  color: ColorsManager.graySimiDark,
                ),
              ),
            ),
          ],
        ),
        SpaceManager.sizedBox12h(context),
        SizedBox(
          height: 85.h,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const GenralBrandListItem();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                );
              },
              itemCount: 10),
        ),
      ],
    );
  }
}
