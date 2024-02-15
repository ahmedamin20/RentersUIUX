import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';

class CarListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CarListAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  // context.pop();
                },
                icon: const  SizedBox()),

            Text(
              TextManager.productAvailable.tr(),
              style: TextStyleManager.textStyle18w700,
            ),

          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
