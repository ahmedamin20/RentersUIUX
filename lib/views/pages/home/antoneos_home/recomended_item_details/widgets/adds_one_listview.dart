

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/adds_one_item.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/check_box_widget.dart';

import '../../../../../../core/resource/colors_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../data/model/addon.dart';
import '../../../../../../view_model/cubit/home_cubit/home_cubit.dart';

class AddsOneListView extends StatefulWidget {
  const AddsOneListView({super.key});

  @override
  State<AddsOneListView> createState() => _AddsOneListViewState();
}

class _AddsOneListViewState extends State<AddsOneListView> {
  List<bool> selectedItems = List.generate(10, (index) => false);
  // List<String> price=[
  //   '10',
  //   '20',
  //   '30'
  // ];
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons!.length,
      itemBuilder: (context,index){
        return   Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText,fontWeight: FontWeight.w600),),
                SizedBox(width: 4.w,),
                Text(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].isRequired!?"(required)":"(optional)",style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.colorText,fontWeight: FontWeight.w600),),
              ],
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index1){
                  return  Row(
                    children: [
                      HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].isMultiSelect!?

            ///////////////multi choose/////////////
                      Checkbox(
                        checkColor: ColorsManager.white,
                        activeColor: ColorsManager.blue,
                        focusColor: ColorsManager.blackColor,
                        hoverColor: ColorsManager.graySimiDark,
                        fillColor:  MaterialStatePropertyAll(selectedItems[index1]==true?ColorsManager.colorBlue:ColorsManager.checkBoxColor),
                        side: const BorderSide(color:ColorsManager.checkBoxColor,width: 3 ),
                        value: selectedItems[index1],
                        onChanged: (value) {
                          setState(() {
                            selectedItems[index1] = !selectedItems[index1];
                            if( selectedItems[index1]==true){
                              HomeCubit.get(context).priceAddOneList.add(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].price!);
                              print("hhh");
                            }
                            else{
                              HomeCubit.get(context).priceAddOneList.remove(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].price!);
                              print("fff");

                            }
                            HomeCubit.get(context).calculatePrice();
                          });
                        },
                      ):
            ///////////////one choose/////////////
                      Checkbox(
                        checkColor: ColorsManager.white,
                        activeColor: ColorsManager.blue,
                        focusColor: ColorsManager.blackColor,
                        hoverColor: ColorsManager.graySimiDark,
                          fillColor:  MaterialStatePropertyAll(HomeCubit.get(context).selectValue == index1?ColorsManager.colorBlue:ColorsManager.checkBoxColor),
                          side: const BorderSide(color:ColorsManager.checkBoxColor,width: 3 ),
                        value: HomeCubit.get(context).selectValue == index1,
                        onChanged: (value) {
                          setState(() {
                            if( HomeCubit.get(context).selectValue == index1){
                              HomeCubit.get(context).priceAddOneList=[];
                              HomeCubit.get(context).selectValue=-1;
                              int i = 0;
                              HomeCubit.get(context).addons.forEach((element)
                              {
                                i++;
                                if(element.id==HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![i].id)
                                {
                                  HomeCubit.get(context).addons[i].items!.remove(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].id);
                                }
                              });
                              print("jjjjjjjjjjjjj${HomeCubit.get(context).addons[0].id}");

                            }
                            else{
                              HomeCubit.get(context).selectValue = index1;
                              if(HomeCubit.get(context).selectValue == index1){
                                HomeCubit.get(context).priceAddOneList=[];
                                HomeCubit.get(context).priceAddOneList.add(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].price!);
                                HomeCubit.get(context).addons.add(
                                    Addons(
                                      items: [HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index].id!],
                                      id:HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].id ,
                                    ));
                                    print("hhhhhhhhhhhhhh${HomeCubit.get(context).addons[0].id}");



                              }
                            }

                            HomeCubit.get(context).calculatePrice();
                          });
                        },
                      ),
    //                   Expanded(
    //                     child: FormBuilderCheckbox(
    //                       selected: false,
    //                       restorationId: 'amr',
    //                       activeColor: ColorsManager.primaryColor,
    //
    //
    //                       onChanged: (value) {
    //                         print(value);
    //                         setState(() {
    //                           HomeCubit.get(context).selectValue = index1;
    // if( HomeCubit.get(context).selectValue == index1){
    //                   HomeCubit.get(context).priceAddOneList=[];
    //                   HomeCubit.get(context).selectValue=-1;
    //                 }
    //                 else{
    //                   HomeCubit.get(context).selectValue = index1;
    //                   if(HomeCubit.get(context).selectValue == index1){
    //                     HomeCubit.get(context).priceAddOneList=[];
    //                     HomeCubit.get(context).priceAddOneList.add(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].price!);
    //                   }
    //                 }
    //
    //
    //                           HomeCubit.get(context).calculatePrice();
    //                         });
    //                       },
    //                       validator: (value) {
    //                         // print("valllllllllllll");
    //                         // print(value);
    //                         // if (value!.isEmpty){
    //                         //   return 'Enter a valid email!';
    //                         // }
    //                         // else{
    //                         //   return null;
    //                         // }
    //                       },
    //                       decoration:const InputDecoration(
    //                           border: InputBorder.none
    //                       ),
    //                       controlAffinity: ,:[price]
    //                           .map((size) => FormBuilderFieldOption(value: size))
    //                           .toList(),
    //                       name: '', title: '',
    //
    //                     ),
    //                   ),
    //



                      Text( HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
                      const Spacer(),
                      Text(  HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items![index1].price.toString(),style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
                      SizedBox(width: 17.w,),
                    ],
                  );
                },
                separatorBuilder: (context,index){
                  return SizedBox(height: 2.h,);
                },
                itemCount:  HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.groupedAddons![index].items!.length!
            ),

            SizedBox(width: 18.w,),


          ],
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 10.h,);
    },);
  }
}

