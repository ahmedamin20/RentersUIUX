// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../core/resource/assets_manager.dart';
// import '../../../core/resource/text_style_manager.dart';
// import '../../../data/model/model_lanageuages/language_model.dart';
// class ChangeLanguage extends StatelessWidget {
//   const ChangeLanguage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 400.h,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
//       ),
//       child: Column(
//         children:
//         [
//           Lottie.asset(AssetsManager.language , width: 150.w),
//
//           SizedBox(
//             height: 200.h,
//             width: ScreenUtil().screenWidth,
//             child: ListView(
//               children: List.generate(languageList.length,
//                     (index) =>
//                     Padding(
//                       padding:  const EdgeInsets.all( 8.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: context.locale.languageCode == languageList[index].code ? ColorsManager.primaryColor : ColorsManager.white,
//
//                             borderRadius: BorderRadius.circular(20.0),
//                             border: Border.all(color: Colors.grey.shade300)
//                         ),
//                         child: ListTile(
//                           onTap: ()
//                           {
//                             context.setLocale(Locale(languageList[index].code));
//                             // cubit.changeLanguage(languageList[index].code);
//                             Navigator.pop(context);
//                           },
//                           title: Text(languageList[index].name , style: TextStyleManager.textStyle16w700.copyWith(color:  context.locale.languageCode == languageList[index].code ? ColorsManager.white : Colors.black),),
//                           leading:Image(image: AssetImage(languageList[index].logo),width: 30.w,height: 30.h,) ,
//                         ),
//                       ),
//                     ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
