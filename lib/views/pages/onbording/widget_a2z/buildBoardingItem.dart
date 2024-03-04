import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';

class buildBoardingItem extends StatelessWidget {
  const buildBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Align(
              alignment: AlignmentDirectional.topEnd,
              child: TextButton(
                onPressed: () {},
                child: Text(
                    TextManager.skip,
                    style: TextStyleManager.textStyle16w700
                ),
              )),
        ),
        SizedBox(
          height: 28.h,
        ),
        SizedBox(
          width: 327.w,
          child: Text(
              TextManager.letsExplore,
              style:TextStyleManager.textStyle34w700
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 204.h,
                width: 204.w,
                child: Image.asset('assets/icons/burger.png'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
