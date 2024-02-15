import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/data/model/product_model/base_product_model.dart';
import 'package:ksb/view_model/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/pages/car_list/widgets/car_list_view_item_body.dart';
import 'package:ksb/views/pages/car_list/widgets/car_list_view_item_footer.dart';
import 'package:ksb/views/pages/car_list/widgets/car_list_view_item_header.dart';

import '../../../componants/custom_cached_network_image/custom_cached_network_image.dart';

class CarsListViewItem extends StatelessWidget {
  const CarsListViewItem({
    super.key,
    required this.productData,
    required this.favouriteFunction,
    required this.index,
    required this.onTap,
  });

  final BaseProductData productData;
  final Function favouriteFunction;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        // padding:
        // EdgeInsets.only(left: 16.r, right: 16.r, top: 16.r, bottom: 18.r),
        decoration: BoxDecoration(
          color:LayoutCubit.get(context).isDark?ColorsManager.grayDark: ColorsManager.inputColor,
          borderRadius: BorderRadius.circular(RadiusManager.r16),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavouriteWidget(
                productData: productData ,
                favouriteFunction: favouriteFunction,
                index: index,
              ),
            ),
            SpaceManager.sizedBox24h(context),
            SizedBox(
              height: 120.h,
              width: double.infinity,
              child: CustomCachedNetworkImage(
                url: productData.images![0].url!,
              ),
            ),
            // const CarListItemHeader(),
            CarListItemBody(price: productData.sellingPrice.toString(),
                title: productData.name!),
            // const Divider(
            //   color: ColorsManager.graySimiDark,
            // ),
            // SpaceManager.sizedBox16h(context),
            // const CarListViewItemFooter(),
          ],
        ),
      ),
    );
  }
}

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    super.key,
    required this.productData,
    required this.favouriteFunction,
    required this.index
  });

  final BaseProductData productData;
  final Function favouriteFunction;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: ()
          {
            favouriteFunction(index);
            FavouriteCubit.get(context).
            toggleProductFavourite(
                productData.id!.toInt() ,
                index );
          },
          child: Align(
              alignment: Alignment.topRight,
              child: productData.favorite ?? false ?
              const Icon(
                Icons.favorite, color: ColorsManager.redColor,) :

              Icon(
                  Icons.favorite_border,
                color:LayoutCubit.get(context).isDark?ColorsManager.white: ColorsManager.blackColor,
              )),


    );
  }
}
