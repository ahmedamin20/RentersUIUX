import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../core/resource/colors_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../view_model/cubit/home_cubit/home_cubit.dart';

class SizeItemListView extends StatefulWidget {
  const SizeItemListView({super.key});

  @override
  State<SizeItemListView> createState() => _SizeItemListViewState();
}

class _SizeItemListViewState extends State<SizeItemListView> {

  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return  ListView.separated(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes!.length,
//       itemBuilder: (context,index){
//         return  Row(
//           children: [
//             Expanded(
//               child: RadioListTile(
//                 title:  Text(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText)),
//                 contentPadding: EdgeInsets.zero,
//                 activeColor: ColorsManager.primaryColor,
//                 value: index,
//                 splashRadius: 12.r,
//                 groupValue: HomeCubit.get(context).selectValue,
//                 onChanged: (value) {
//                   setState(() {
//                     HomeCubit.get(context).selectValue =value!;
//                     if( HomeCubit.get(context).selectValue ==index!){
//                       HomeCubit.get(context).sizeItem=double.parse(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].price!.toString());
// // =======
// //
// //                       // HomeCubit.get(context).sizeItem=HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].price!;
// // >>>>>>> origin/ahmed15/2
//                     }
//                     HomeCubit.get(context).calculatePrice();
//                   });
//                 },
//
//               ),
//             ),
//             Text('${HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].price!.toString()} LE'),
//             SizedBox(width: 18.w,),
// =======
    return  Form(
      key: HomeCubit.get(context).formKey2,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes!.length,
        itemBuilder: (context,index){
          return  Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title:  Text(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText)),
                      contentPadding: EdgeInsets.zero,
                      activeColor: ColorsManager.primaryColor,
                      value: index,
                      splashRadius: 12.r,
                      groupValue: HomeCubit.get(context).selectValue,
                      onChanged: (value) {
                        setState(() {
                          HomeCubit.get(context).selectValue =value!;
                          if( HomeCubit.get(context).selectValue ==index!){
                            HomeCubit.get(context).sizeItem=double.parse(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].price!.toString());
                            HomeCubit.get(context).size = HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].name!;
                          }

                          HomeCubit.get(context).calculatePrice();
                        });
                      },

                    ),
                  ),

                  Text('${HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes![index].price!.toString()} LE'),
                  SizedBox(width: 18.w,),

                ],
              ),

          FormField(
          validator: (value){
          return HomeCubit.get(context).selectValue == null ? "Required field" : null;
          }, builder: (FormFieldState<Object> field) {
            return const SizedBox();
          },
          ),
            ],
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10.h,);
      },),
    )
    ;
  }
}
