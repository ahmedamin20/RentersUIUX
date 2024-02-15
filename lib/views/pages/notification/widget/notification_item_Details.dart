import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';

class NotificationItemDetails extends StatelessWidget {
  const NotificationItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h,),
              Container(
                clipBehavior: Clip.antiAlias,
                width: 343.w,
                height: 246.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const CustomCachedNetworkImage(url: 'https://th.bing.com/th/id/R.913becf9f884742c3bae5764e35ae12b?rik=zxv5oidL7n59fQ&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f2%2f9%2f7%2f494243.jpg&ehk=jbHEDfWJ%2fvfSK7S0gPqDY4mLwcyroJZp5ma9w4jrfOw%3d&risl=&pid=ImgRaw&r=0'),
              ),
              SizedBox(height: 20.h,),
              Text('Bonus week - %20',style: TextStyleManager.textStyle24w600,),
              SizedBox(height: 16.h,),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum sit eu morbi velit praesent. Fermentum mauris fringilla vitae feugiat vel sit blandit quam. In mi sodales nisl eleifend duis porttitor. Convallis euismod facilisis neque eget praesent diam in nulla. Faucibus interdum vulputate rhoncus mauris id facilisis est nunc habitant. Velit posuere facilisi tortor sed. Lectus a velit sed pretium egestas integer lacus, mi. Risus eget venenatis at amet sed. Fames rhoncus purus ornare nulla. Lorem dolor eget sagittis mattis eget nam. Nulla nisi egestas nisl nibh eleifend luctus.',
                style: TextStyleManager.textStyle16w500.copyWith(fontWeight: FontWeight.w400,),
              )

            ],
          ),
        ),
      ),
    );
  }
}
