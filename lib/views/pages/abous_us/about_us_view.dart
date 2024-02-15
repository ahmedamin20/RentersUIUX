// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ksb/core/resource/colors_manager.dart';
// import 'package:ksb/core/resource/text_manager.dart';
// import 'package:ksb/core/resource/text_style_manager.dart';
// import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';
//
// class AboutUsScreen extends StatelessWidget {
//   const AboutUsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: const CustomAppBar(title: TextManager.aboutUs),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 32.h,),
//               Text('1.9.4',style: TextStyleManager.textStyle20w600,),
//               Text(TextManager.currentVersion,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
//               SizedBox(height: 24.h,),
//               Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 16.w),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Divider(height: 1.h,color: ColorsManager.checkBoxColor,),
//                     SizedBox(height: 24.h,),
//                     Text(TextManager.shortAboutUse,style: TextStyleManager.textStyle20w500,),
//                     SizedBox(height: 16.h,),
//                     Text('Bibendum sit eu morbi velit praesent. Fermentum mauris fringilla vitae feugiat vel sit blandit quam. In mi sodales nisl eleifend duis porttitor. Convallis euismod facilisis neque eget praesent diam in nulla. Faucibus interdum vulputate rhoncus mauris id facilisis est nunc habitant. Velit posuere facilisi tortor sed. ',
//                     style: TextStyleManager.textStyle16w500.copyWith(fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(height: 24.h,),
//                     Text(TextManager.vission,style: TextStyleManager.textStyle20w500,),
//                     SizedBox(height: 16.h,),
//                     Text('Lectus a velit sed pretium egestas integer lacus, mi. Risus eget venenatis at amet sed. Fames rhoncus purus ornare nulla. Lorem dolor eget sagittis mattis eget nam. Nulla nisi egestas nisl nibh eleifend luctus.',
//                       style: TextStyleManager.textStyle16w500.copyWith(fontWeight: FontWeight.w400),
//                     ),
//
//                   ],
//                 ),
//               )
//
//
//
//
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }
