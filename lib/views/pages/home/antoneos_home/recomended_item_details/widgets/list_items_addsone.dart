
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/data/model/cart_model/cart_model.dart';

import '../../../../../../core/resource/colors_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import 'check_box_widget.dart';

class ListItemsAddOns extends StatelessWidget {
  const ListItemsAddOns({super.key, required this.groupedAddons});
  final GroupedAddons groupedAddons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
          return  Row(
            children: [
              Text(groupedAddons.items![index].name!,style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
              SizedBox(width: 4.w,),
              Text(groupedAddons.items![index].price!.toString(),style: TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),),
            ],
          );
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 2.h,);
        },
        itemCount: groupedAddons.items!.length
    );
  }
}
