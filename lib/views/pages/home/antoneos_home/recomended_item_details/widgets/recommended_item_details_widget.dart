
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/adds_one_listview.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/size_items_listvie.dart';

import '../../../../../../view_model/cubit/home_cubit/home_cubit.dart';
import 'custom_divider.dart';

class RecommendedItemDetailsWidget extends StatefulWidget {
  const RecommendedItemDetailsWidget({super.key, required this.productId});
  final String productId;

  @override
  State<RecommendedItemDetailsWidget> createState() => _RecommendedItemDetailsWidgetState();
}

class _RecommendedItemDetailsWidgetState extends State<RecommendedItemDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   HomeCubit.get(context).backToDefault();
    HomeCubit.get(context).showOneBranchProduct(
        productId: widget.productId,
        branchId: HomeCubit.get(context).branchId ?? HomeCubit.get(context).showAllBranchModel!.data![0].storeId!
    );



  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      buildWhen: (previous,current){

        if((current is BranchOneProductLoading||current is BranchOneProductSuccess||current is BranchOneProductError)){
          return true;
        }
        else{
          return false;
        }
      },
      listener: (context,state){
        if(state is BranchOneProductSuccess){
          if(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.price!=null){
            HomeCubit.get(context).priceOfItem=double.parse(HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.price);
            HomeCubit.get(context).calculatePrice();
          }

        }
      },
      builder: (context,state){
        return state is BranchOneProductLoading?
        const CustomCardShimmer(number: 2,):
           (HomeCubit.get(context).showOneProductModel!=null&&state is BranchOneProductSuccess)?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 28.63.h,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.h),
                    topRight: Radius.circular(16.w),
                    bottomLeft: Radius.circular(8.h),
                    bottomRight: Radius.circular(8.h)),
              ),
              child:  CustomCachedNetworkImage(
                  url:
                 HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.mainImage!,
              ),
            ),
            SizedBox(
              height: 16.08.h,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.name!,
                            style: TextStyleManager.textStyle20w600.copyWith(
                                fontWeight: FontWeight.w500,
                                color: ColorsManager.colorText),
                          ),
                          const Spacer(),
                          HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.price!=null?
                          Text( HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.price!,
                          style: TextStyleManager.textStyle14w500.copyWith(color: ColorsManager.colorXPrimary),
                          ):
                              const SizedBox(),
                          SizedBox(width: 10.w,),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.description!,
                        style: TextStyleManager.textStyle12w500.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorsManager.gray2),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      HomeCubit.get(context).showOneProductModel!.showOneProductData!.product!.sizes!=null?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           TextManager.size,
                            style: TextStyleManager.textStyle16w500
                                .copyWith(color: ColorsManager.colorText),
                          ),
                          SizedBox(
                            width: 2.h,
                          ),
                          const SizeItemListView(),
                        ],
                      ):
                       const SizedBox(),
                      SizedBox(
                        height: 3.h,
                      ),
                      const CustomDivider(),
                      SizedBox(
                        height: 17.h,
                      ),
                      Text(
                        TextManager.addsOne,
                        style: TextStyleManager.textStyle16w500
                            .copyWith(color: ColorsManager.colorText),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const AddsOneListView(),
                      SizedBox(
                        height: 117.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ):
        state is BranchOneProductError?
        const Text('Error'):
        const SizedBox()
        ;
      },
    );
  }
}
