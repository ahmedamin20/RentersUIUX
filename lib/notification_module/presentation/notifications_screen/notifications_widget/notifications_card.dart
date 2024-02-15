import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/notification_module/presentation/manager/notification_cubit/notification_cubit.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../data/models/notification_model.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key, required this.notificationModelData , required this.index});

  final NotificationModelData notificationModelData;
  final int index;

  bool typeOfMessage() {
    return notificationModelData.body!.notificationType == "message_sent";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h, right: 10.w, left: 10.w),
      child: Container(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 10.w, left: 10.w),
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(14.sp),

          border: Border.all(color:!notificationModelData.seen!
              ? ColorsManager.redColor : ColorsManager.green, width: 3),
          boxShadow:  const [
            BoxShadow(
                blurRadius: 2,
                color: ColorsManager.greyscale200,
                offset: Offset(0, 0),
                spreadRadius: 1)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 5.w),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(8.sp),
                  child:  SvgPicture.asset(
                          AssetsManager.MESSAGE,
                          color: ColorsManager.primaryColor
                        )
                     ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 240.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "${typeOfMessage() ?
                          "Message" :
                          "Car Fix".tr()} ",
                          style: TextStyleManager.textStyle16w700,
                        ),
                        const Spacer(),
                        Text(
                          notificationModelData.createdAt!,
                          style: TextStyleManager.textStyle16w700,

                        ),
                        Spacer(),
                        // IconButton(onPressed: ()
                        // {
                        //   NotificationCubit.get(context).deleteOneNotification(notificationModelData.id!, index);
                        // }, icon: const Icon(Icons.delete_forever , color: ColorsManager.redColor,))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 1.sw - 150.w,
                    child: Text(
                      notificationModelData.body!.message!,
                      style: TextStyleManager.textStyle16w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
