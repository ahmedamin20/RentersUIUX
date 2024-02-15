import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';

import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/views/componants/custom_card_car.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'package:ksb/views/componants/custom_empty_data/custom_empty_data.dart';
import 'package:ksb/views/componants/custom_error_widget/custom_error_widget.dart';
import 'package:ksb/views/pages/home/widgets/favorites/widgets/favorires_list.dart';

import '../../../../../core/services/app_router.dart';
import '../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../data/repository/grage_car_repo/grage_car_repo.dart';
import '../../../../../view_model/cubit/car`s_grage/car_s_grage_cubit.dart';
import '../../../../componants/custom_snack_bar/custom_snack_bar.dart';
import '../../../car_list/widgets/car_list_view_item.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: FavouriteCubit.get(context)..getFavouriteData()..pageination(),
  child: BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FavouriteCubit cubit = FavouriteCubit.get(context);
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: AnimationLimiter(
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "10 car",
                  //       style: TextStyleManager.textStyle18w700.copyWith(
                  //         color: ColorsManager.grayDark,
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: Row(children: [
                  //         Text(
                  //           "sort",
                  //           style: TextStyleManager.textStyle14w500.copyWith(
                  //             color: ColorsManager.graySimiDark,
                  //           ),
                  //         ),
                  //         SpaceManager.sizedBox8w(context),
                  //         Icon(
                  //           Icons.sort,
                  //           color: ColorsManager.gray,
                  //           size: 14.r,
                  //         ),
                  //       ]),
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: 10.h
                    ,),
                  (cubit.getProductFavouriteModel!=null)?
                  (cubit.getProductFavouriteModel!.data!.isEmpty)?
                  const Center(child: CustomEmptyData()):
                  BlocConsumer<FavouriteCubit, FavouriteState>(
                    listener: (context, state)
                    {
                      if(state is ToggleFavouriteSuccessState)
                      {
                        for (var e in ProductCubit.get(context).getProductModel!.data!) {
                          if(e.id == cubit.getProductFavouriteModel!.data![state.index].id)
                          {
                            e.isFavorite = false;
                            break;
                          }
                        }
                        cubit.getProductFavouriteModel!.data!.removeAt(state.index);

                      }
                      // TODO: implement listener
                    },
                    builder:(context, state) {
                      return   Expanded(
                        child: AnimationLimiter(
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.5,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                            itemCount: cubit.getProductFavouriteModel!.data!.length,
                            controller: cubit.scrollController,
                            itemBuilder: (context, index)
                            {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: cubit.getProductFavouriteModel!.data!.length,
                                child: ScaleAnimation(

                                  child: FadeInAnimation(
                                    child: CarsListViewItem(
                                      onTap: ()
                                      {
                                        ProductCubit.get(context).getProductDetiles(
                                            cubit.getProductFavouriteModel!.data![index].id!.toInt());
                                        context.push(AppRouter.detailsView  ,
                                            extra: {
                                              "id": cubit.getProductFavouriteModel!.data![index].id
                                            });
                                      },
                                      favouriteFunction: (favouriteIndex)
                                      {
                                        cubit.getProductFavouriteModel!.data![index].isFavorite =!
                                        cubit.getProductFavouriteModel!.data![index].favorite!;
                                        FavouriteCubit.get(context).getFavouriteData();
                                      },
                                      index: index,
                                      productData: cubit.getProductFavouriteModel!.data![index],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                      // DefaultTabController(
                      //   length: 2,
                      //   child: Column(
                      //     children:
                      //     [
                      //       Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 16.w),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(16.r),
                      //           color: ColorsManager.white,
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: ColorsManager.greyscale200,
                      //               blurRadius: 10.r,
                      //               offset: const Offset(0, 10),
                      //             ),
                      //           ],
                      //         ),
                      //         child: TabBar(
                      //           indicator: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(16.r),
                      //             color: ColorsManager.primaryColor,
                      //           ),
                      //           labelStyle: TextStyleManager.textStyle16w700.copyWith(color: ColorsManager.white),
                      //           unselectedLabelStyle: TextStyleManager.textStyle16w700.copyWith(color: ColorsManager.grayDark),
                      //           unselectedLabelColor: ColorsManager.grayDark,
                      //           tabs: [
                      //             Tab(
                      //               child: Text(
                      //                 TextManager.products.tr(),
                      //                 style: TextStyleManager.textStyle16w700,
                      //               ),
                      //             ),
                      //             Tab(
                      //               child: Text(
                      //                 TextManager.cars.tr(),
                      //                 style: TextStyleManager.textStyle16w700,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       const  SizedBox(),
                      //       SizedBox(
                      //         height: 450.h,
                      //         child: TabBarView(
                      //             children: [
                      //               AnimationLimiter(
                      //                 child: GridView.builder(
                      //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //                       crossAxisCount: 2,
                      //                       childAspectRatio: 1 / 1.5,
                      //                       crossAxisSpacing: 16,
                      //                       mainAxisSpacing: 16),
                      //                   itemCount: cubit.getProductFavouriteModel!.data!.length,
                      //                   controller: cubit.scrollController,
                      //                   itemBuilder: (context, index) {
                      //                     return AnimationConfiguration.staggeredGrid(
                      //                       position: index,
                      //                       duration: const Duration(milliseconds: 375),
                      //                       columnCount: cubit.getProductFavouriteModel!.data!.length,
                      //                       child: ScaleAnimation(
                      //
                      //                         child: FadeInAnimation(
                      //                           child: CarsListViewItem(
                      //                             favouriteFunction: (favouriteIndex)
                      //                             {
                      //                               cubit.getProductFavouriteModel!.data![index].isFavorite =!
                      //                               cubit.getProductFavouriteModel!.data![index].favorite!;
                      //
                      //                             },
                      //                             index: index,
                      //                             productData: cubit.getProductFavouriteModel!.data![index],
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     );
                      //                   },
                      //                 ),
                      //               ),
                      //               Padding(
                      //                 padding: const EdgeInsets.all(8.0),
                      //                 child: BlocProvider(
                      //                   create:(context)=> CarSGrageCubit(sl<GrageCarRepoImpl>())..getCarSGrageData(favorites_only: true)..pageination(),
                      //                   child: BlocConsumer<CarSGrageCubit, CarSGrageState>(
                      //                     listener: (context, state) {},
                      //                     builder: (context, state) {
                      //                       CarSGrageCubit cubit = CarSGrageCubit.get(context);
                      //                       if (cubit.carGrageModel != null) {
                      //                         return     BlocConsumer<FavouriteCubit, FavouriteState>(
                      //                           listener: (context, state)
                      //                           {
                      //                             if(state is ToggleFavouriteLoadingState)
                      //                             {
                      //                               print("Amr");
                      //                               cubit.carGrageModel!.data![state.index].favorite =!cubit.carGrageModel!.data![state.index].favorite!;
                      //                             }
                      //                             if(state is ToggleFavouriteSuccessState)
                      //                             {
                      //
                      //                               if(  !cubit.carGrageModel!.data![state.index].favorite!)
                      //                               {
                      //                                 cubit.carGrageModel!.data!.removeAt(state.index);
                      //                               }
                      //                               customSnackBar(message: "Add Favourite Successfully",
                      //                                   snackBarType: SnackBarType.success, context: context);
                      //                             }else if(state is ToggleFavouriteErrorState)
                      //                             {
                      //                               cubit.carGrageModel!.data![state.index].favorite =!cubit.carGrageModel!.data![state.index].favorite!;
                      //                               customSnackBar(message: state.error,
                      //                                   snackBarType: SnackBarType.error, context: context);
                      //                             }
                      //                             // TODO: implement listener
                      //                           },
                      //                           builder: (context, state) {
                      //                             return AnimationLimiter(
                      //                               child: ListView.separated(
                      //                                 controller: cubit.scrollController ,
                      //                                   itemBuilder: (context, index) {
                      //                                     return  AnimationConfiguration.staggeredList(
                      //                                       position: index,
                      //                                       duration: const Duration(milliseconds: 500),
                      //
                      //                                       child: SlideAnimation(
                      //                                         verticalOffset: 50.0,
                      //
                      //                                         child: FadeInAnimation(
                      //                                           child: CustomCarCard(baseGrageModel:  cubit.carGrageModel!.data![index], onTap: ()
                      //                                           {
                      //                                             FavouriteCubit.get(context).toggleProductFavourite(
                      //                                                 cubit.carGrageModel!.data![index].id!.toInt() , index ,
                      //                                                 type: "car"
                      //                                             );
                      //                                           }),
                      //                                         ),
                      //                                       ),
                      //                                     );
                      //                                   },
                      //                                   separatorBuilder: (context, index) => const Divider(),
                      //                                   itemCount: cubit.carGrageModel!.data!.length),
                      //                             );
                      //                           },
                      //                         );
                      //                       } else if (state is GetCarSGrageLoadingState) {
                      //                         return const Center(child: CircularProgressIndicator());
                      //                       }
                      //                       else {
                      //                         return const Center(child: CircularProgressIndicator());
                      //                       }
                      //                     },
                      //                   ),
                      //                 ),
                      //               ),
                      //             ]),
                      //       )
                      //     ],
                      //   ),
                      // );
                    },
                  ) :
                  (state is FavouriteError)? const Center(child: CustomErrorWidget(),):
                  CustomCardShimmer(),

                ],
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
