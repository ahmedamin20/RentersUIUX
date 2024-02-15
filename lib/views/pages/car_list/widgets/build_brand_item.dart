import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

import '../../../../data/model/brand_model/brand_model.dart';
class BuildBrandItem extends StatelessWidget {
  const BuildBrandItem({
    super.key ,
    required this.baseBrandModel
  });
 final  BaseBrandModel baseBrandModel;
  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: LayoutCubit.get(context).isDark?Colors.white:ColorsManager.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [

          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(baseBrandModel.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            child: Text(
              baseBrandModel.name!,
              style: TextStyleManager.textStyle12w700.copyWith(color: LayoutCubit.get(context).isDark?Colors.black:Colors.white)
            ),
          ),

        ],
      ),
    );
  }
}
