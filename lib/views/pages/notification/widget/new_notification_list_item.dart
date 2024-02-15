import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class NewNotificationListItem extends StatelessWidget {
  const NewNotificationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(300.0),
            child: CircleAvatar(
                radius: 24.r,
              child: Image.asset(AssetsManager.carImage),
            ),
          ),
          SizedBox(
            width: 18.r,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "fafsfdsafdsafa",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleManager.textStyle16w500
                      ,
                ),
                Text(
                  "dsgsfdgfdsgsdhshgdyjdrgsdfadsfdsfgdssfregafgaregrgaegrregeagregsafdskjf;ifj[owaejfdf",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleManager.textStyle12w500.copyWith(fontWeight: FontWeight.w400).copyWith(
                      letterSpacing: 0.40.w,
                      height: 1.5.h,
                      color: ColorsManager.gray2),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
