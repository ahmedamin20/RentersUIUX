import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/data/model/show_all_branch_product/show_all_branch_product.dart';
import 'package:ksb/views/componants/custom_cached_network_image/custom_cached_network_image.dart';

import '../../../../../../core/resource/colors_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../core/services/app_router.dart';
import '../../../../../view_model/cubit/home_cubit/home_cubit.dart';


class RecommendedDetailsItem extends StatelessWidget {
  final ShowAllBranchProductData showAllBranchProductData;

  const RecommendedDetailsItem( {super.key, required this.showAllBranchProductData,});

  @override
  Widget build(BuildContext context) {
    double smallSize=20000000000;
    if(showAllBranchProductData.product!.sizes!=null){
      for (int i=0;i<showAllBranchProductData.product!.sizes!.length;i++) {
        if(smallSize>showAllBranchProductData.product!.sizes![i].price!){
          smallSize=showAllBranchProductData.product!.sizes![i].price!;
        }

      }
    }
    return InkWell(
      onTap: (){

        context.push((AppRouter.recommendedItemDetails),extra: {
          'id':showAllBranchProductData.id
        });



      },
      child: ListTile(
        leading:CustomCachedNetworkImage(width: 80.w, url: showAllBranchProductData.product!.mainImage!),
        title: Text(
          showAllBranchProductData.product!.name! ,
          style: TextStyleManager.textStyle16w500,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              showAllBranchProductData.product!.description!,
              style: TextStyleManager.textStyle14w400.copyWith(
                  color: ColorsManager.gray2
              ),
            ),
            showAllBranchProductData.product!.price!=null? Text(
              '\$ ${showAllBranchProductData.product!.price!}',
              style: TextStyleManager.textStyle14w400.copyWith(
                  color: Colors.red
              ),
            ):Text(
              '\$ $smallSize',
              style: TextStyleManager.textStyle14w400.copyWith(
                  color: Colors.red
              ),
            )
          ],
        ),
      ),
    );
  }
}
