import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/app_router.dart';
import 'old_notification_list_item.dart';

class OldNotificationListView extends StatelessWidget {
  const OldNotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 16.w,top: 16.h,bottom: 16.h),
          child: Text(TextManager.oldNotification,style: TextStyleManager.textStyle16w500.copyWith(color: ColorsManager.gray2),),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: ((context, index) {
            return InkWell(
                onTap: (){
                  context.push((AppRouter.notificationItemDetails));
                },
                child: const OldNotificationListItem());
          }), separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 32.h,);
        },),
      ],
    );
  }
}
