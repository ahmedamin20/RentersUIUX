import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/pages/notification/widget/new_notification_list_view.dart';

import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';
import 'package:ksb/views/pages/notification/widget/new_notification_list_item.dart';
import 'package:ksb/views/pages/notification/widget/old_notification_list_item.dart';
import 'package:ksb/views/pages/notification/widget/old_notification_list_view.dart';

import '../../../core/resource/space_manager.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: TextManager.notification,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NewNotificationListView(),
            SpaceManager.sizedBox40h(context),
            const OldNotificationListView(),
          ],
        ),
      )
    );
  }
}
