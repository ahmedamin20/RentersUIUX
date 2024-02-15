import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_icon_button.dart';

class FavoritesListViewItemHeader extends StatelessWidget {
  const FavoritesListViewItemHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: ColorsManager.blue,
              borderRadius: BorderRadius.circular(RadiusManager.r8)),
          child: Text(
            TextManager.freeTestDrive,
            style: TextStyleManager.textStyle10w700
                .copyWith(color: ColorsManager.white),
          ),
        ),
        CustomIconButton(
          onTap: () {},
          iconData: Icons.favorite,
          padding: 0,
        )
      ],
    );
  }
}
