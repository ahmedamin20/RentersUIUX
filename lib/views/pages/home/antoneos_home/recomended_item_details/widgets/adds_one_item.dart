//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ksb/data/model/show_one_product_model/show_one_product_model.dart';
//
// import '../../../../../../core/resource/colors_manager.dart';
// import '../../../../../../core/resource/text_style_manager.dart';
// import 'check_box_widget.dart';
// import 'list_items_addsone.dart';
//
// class AddsOneItem extends StatelessWidget {
//   const AddsOneItem({super.key, required this.groupedAddons});
//   final GroupedAddons groupedAddons;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Text(groupedAddons.name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText,fontWeight: FontWeight.w600),),
//             SizedBox(width: 4.w,),
//             Text(groupedAddons.isRequired!?"(required)":"(optional)",style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText,fontWeight: FontWeight.w600),),
//           ],
//         ),
//         ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context,index){
//               return  Row(
//                 children: [
//                   CustomCheckBox(),
//                   Text(groupedAddons.items![index].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
//                   const Spacer(),
//                   Text(groupedAddons.items![index].price!.toString(),style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
//                   SizedBox(width: 17.w,),
//                 ],
//               );
//             },
//             separatorBuilder: (context,index){
//               return SizedBox(height: 2.h,);
//             },
//             itemCount: groupedAddons.items!.length
//         ),
//
//         SizedBox(width: 18.w,),
//
//
//       ],
//     );
//   }
// }
