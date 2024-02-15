import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/componants/custom_icon_button.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(iconData: Icons.location_on_outlined, onTap: () {}),
        SpaceManager.sizedBox12w(context),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextManager.location,
              style: TextStyleManager.textStyle12w500
                  .copyWith(color: ColorsManager.graySimiDark),
            ),
            Text(
              "San Fransisco",
              style: TextStyleManager.textStyle12w500
                  .copyWith(color: ColorsManager.grayDark),
            ),
          ],
        ),
        const Spacer(),
        CustomIconButton(
          iconData: Icons.notifications_none_outlined,
          onTap: () {
            context.push(AppRouter.notificationView);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.h);
}
