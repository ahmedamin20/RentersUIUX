import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ksb/views/componants/custom_app_bar/custom_app_bar.dart';

import '../../../core/services/service_locator/service_locator.dart';
import '../../../data/repository/brand_repo/brand_repo.dart';
import '../../../view_model/cubit/brand_cubit/brand_cubit.dart';
import '../../../view_model/cubit/favourite_cubit/favourite_cubit.dart';
import '../../../view_model/cubit/product_cubit/product_cubit.dart';
import '../../componants/custom_card_shimmer/custom_card_shimmer.dart';
import '../../componants/custom_empty_data/custom_empty_data.dart';
import '../../componants/custom_error_widget/custom_error_widget.dart';
import '../../componants/custom_snack_bar/custom_snack_bar.dart';
import '../car_list/widgets/car_list_view_item.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key,
    required this.id,
    required this.brandName
  });

  final int id;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandCubit>
      (
        create: (context) =>
        BrandCubit(sl<BrandRepoImpl>())
          ..getProductBrand(id)
          ..onScrollProduct(id),
        child:
        BlocConsumer<BrandCubit, BrandState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            BrandCubit cubit = BrandCubit.get(context);
            return Scaffold
              (
              appBar: AppBarCustom(
                title: brandName,
              ),
              body: (state is BrandProductLoading) ?
               const CustomCardShimmer() :
              cubit.getProductModel != null ?
              BlocConsumer<FavouriteCubit, FavouriteState>(
                listener: (context, state) async
                {
                  if (state is ToggleFavouriteLoadingState) {
                    // print("Amr");
                    cubit.getProductModel!.data![state.index].isFavorite =
                    !cubit.getProductModel!.data![state.index].favorite!;
                  }
                  if (state is ToggleFavouriteSuccessState) {
                    if (cubit.getProductModel!.data![state.index].favorite!) {
                      if (FavouriteCubit
                          .get(context)
                          .getProductFavouriteModel == null) {
                        await FavouriteCubit
                            .get(context)
                            .getFavouriteData();
                      }
                      FavouriteCubit
                          .get(context)
                          .getProductFavouriteModel!
                          .data!
                          .add(cubit.getProductModel!.data![state.index]);
                    }
                    customSnackBar(message: "Add Favourite Successfully".tr(),
                        snackBarType: SnackBarType.success, context: context);
                  } else if (state is ToggleFavouriteErrorState) {
                    cubit.getProductModel!.data![state.index].isFavorite =
                    !cubit.getProductModel!.data![state.index].favorite!;
                    customSnackBar(message: state.error,
                        snackBarType: SnackBarType.error, context: context);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return (cubit.getProductModel!.data!.isEmpty) ?
                  const
                  CustomEmptyData()
                      :
                  SingleChildScrollView(

                    controller: cubit.scrollControllerProduct,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          AnimationLimiter(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                              itemCount: cubit.getProductModel!.data!.length,
                              itemBuilder: (context, index) {
                                return
                                  AnimationConfiguration.staggeredGrid(
                                    columnCount: cubit.getProductModel!.data!
                                        .length,
                                    position: index,
                                    duration: const Duration(milliseconds: 750),
                                    child: ScaleAnimation(
                                      duration: const Duration(milliseconds: 750),
                                      child: CarsListViewItem(
                                        onTap: () {
                                          ProductCubit.get(context).getProductDetiles(
                                              cubit.getProductModel!.data![index].id!
                                                  .toInt());
                                        },
                                        favouriteFunction: (favouriteIndex) {
                                          // cubit.getProductModel!.data![favouriteIndex].isFavorite =!
                                          // cubit.getProductModel!.data![favouriteIndex].favorite!;
                                          // print(cubit.getProductModel!.data![favouriteIndex].favorite);
                                        },
                                        index: index,
                                        productData: cubit.getProductModel!
                                            .data![index],
                                      ),
                                    ),
                                  );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  :
              const CustomErrorWidget(),
            );
          },
        ));
  }
}
