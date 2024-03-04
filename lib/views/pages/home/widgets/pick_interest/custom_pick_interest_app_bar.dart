import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/componants/custom_text_Button.dart';

class CustomPickInterestAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPickInterestAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  context.go(AppRouter.homeView);
                },
                icon: const Icon(Icons.arrow_back)),
            CustomTextButton(
              text: TextManager.skip,
              onPressed: () {
                context.go(AppRouter.homeView);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
