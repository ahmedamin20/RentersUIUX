import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomFilterAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomFilterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.grayDark,
      centerTitle: true,
      leadingWidth: MediaQuery.of(context).size.width * 0.20,
      leading: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => context.pop(),
        child: Text(TextManager.cancel,
            maxLines: 1,
            style: TextStyleManager.textStyle14w500.copyWith(
              color: ColorsManager.gray,
            )),
      ),
      title: Text(
        TextManager.filters,
        style: TextStyleManager.textStyle18w700,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 40.h);
}
