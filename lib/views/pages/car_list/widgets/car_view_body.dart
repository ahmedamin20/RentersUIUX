import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:ksb/view_model/cubit/information_cubit/information_cubit.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_empty_data/custom_empty_data.dart';
import 'package:ksb/views/componants/custom_error_widget/custom_error_widget.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/pages/car_list/widgets/car_list_view_item.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../componants/custom_text_form_field.dart';
import '../../car_details/pages/car_details.dart';
import 'BuildWidgetBrand.dart';
import 'ads_widget.dart';

class CarViewBody extends StatelessWidget {
  const CarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff25D366),
        onPressed: ()
        async
        {
          final Uri _url =
          Uri.parse(InformationCubit.get(context).getInfoDataModel!.data!.whatsapp!);

          if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
        }
        },
        child:  const Icon(FontAwesomeIcons.whatsapp),
      ),
      body: BlocProvider.value(
        value:ProductCubit.get(context)..
        getProduct()..
        pageination(),
        child: BlocConsumer<ProductCubit, ProductState>
          (
          listener: (context, state)
          {
            if(state is ProductDetilesError)
              {
                EasyLoading.dismiss();
                customSnackBar(message: state.failure.message.toString(),
                    snackBarType: SnackBarType.error, context: context);
              }else if(state is ProductDetilesLoading)
                {
                  customEasyLoading();
                }else if(state is ProductDetilesSuccess)
                  {
                    EasyLoading.dismiss();
                    context.push(AppRouter.detailsView  ,
                        extra: {
                          "id": state.getProductDetilesModel.data!.id
                        });
                  }
            // TODO: implement listener
          },
          builder: (context, state) {
            ProductCubit cubit = ProductCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                controller: cubit.scrollController,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    CustomTextFormField(
                      prefixIcon: Icons.search,
                      textHint: "Search".tr(),
                      onEditingComplete: () {
                        cubit.isSearch = true;
                        cubit.page = 1;
                        cubit.getProduct(search: cubit.searchController.text);
                      },
                      controller: cubit.searchController,
                      suffixIcon: (cubit.isSearch) ? Icons.close : null,
                      changePasswordVisibility: () {
                        cubit.searchController.clear();
                        cubit.isSearch = false;
                        cubit.page = 1;
                        cubit.getProduct();
                      },
                    ),
                   SizedBox(height: 12.h,),
                   Text(TextManager.ads.tr() ,
                       style: TextStyleManager.textStyle18w700.copyWith(
                         color: ColorsManager.primaryColor
                       )),
                    SizedBox(height: 12.h,),

                    SizedBox(

                       height: 200.h,
                       child: const AdsWidget()),

                    SizedBox(height: 10.h,),
                    Text(TextManager.brand.tr() ,
                        style: TextStyleManager.textStyle18w700.
                        copyWith(
                            color: ColorsManager.primaryColor
                        )),
                    SizedBox(height: 10.h,),
                    const BuildWidgetBrand(),
                    SizedBox(height: 10.h,),
                    Text(TextManager.products ,
                        style: TextStyleManager.textStyle18w700.copyWith(
                            color: ColorsManager.primaryColor
                        )),
                    SizedBox(height: 10.h,),

                    Padding(
                      padding: EdgeInsets.only(
                        left: 24.r,
                        right: 24.r,
                        bottom: 8.r,
                      ),
                      child: const Row(
                        children: [
                          // CustomFilterButton(
                          //   onTap: () {
                          //     context.push(AppRouter.filterView);
                          //   },
                          // ),
                          // Expanded(
                          //   child: SizedBox(
                          //     height: 30.h,
                          //     child: ListView.separated(
                          //       padding: const EdgeInsets.symmetric(horizontal: 10),
                          //       itemCount: 20,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index)
                          //       {
                          //         return CustomFilterButton(
                          //           onTap: () {},
                          //         );
                          //       },
                          //       separatorBuilder: (context, index) =>
                          //           SizedBox(
                          //             width: 10.r,
                          //           ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    //  ElevatedButton(onPressed: (){
                    // AppRouter.ctx!.push(
                    //      AppRouter.cardetails,
                    //        extra:
                    //        {
                    //          'id': 103,
                    //          "cubit" : CarFixesCubit(sl<CarFixesRepoImpl>()),
                    //          "carName" : "car Fix"
                    //        }
                    //    );
                    //
                    //
                    //  }, child: Text("aasdas")),
                    (state is GetProductLoading) ?
                    const CustomCardShimmer() :
                    cubit.getProductModel != null ?
                    BlocConsumer<FavouriteCubit, FavouriteState>(
                      listener: (context, state) async
                      {
                        if (state is ToggleFavouriteLoadingState)
                        {
                          // print("Amr");
                          cubit.getProductModel!.data![state.index].isFavorite =
                          !cubit.getProductModel!.data![state.index].favorite!;
                        }
                        if (state is ToggleFavouriteSuccessState) {
                          if (cubit.getProductModel!.data![state.index].favorite!) {
                            if(  FavouriteCubit
                                .get(context)
                                .getProductFavouriteModel==null)
                              {
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
                        AnimationLimiter(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // controller: cubit.scrollController,
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
                                          cubit.getProductModel!.data![index].id!.toInt());
                                    },
                                    favouriteFunction: (favouriteIndex)
                                    {
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
                        );
                      },
                    )
                        :
                    const CustomErrorWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
