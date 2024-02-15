import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/car%60s_grage/car_s_grage_cubit.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_text_Button.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';

import '../../../core/services/service_locator/service_locator.dart';
import '../../../data/model/brands_model/brands_model.dart';
import '../../../data/model/car_grage_model/car_grage_model.dart';
import '../../../data/repository/grage_car_repo/grage_car_repo.dart';
import '../../../view_model/cubit/favourite_cubit/favourite_cubit.dart';
import '../../componants/custom_card_car.dart';
import '../../componants/custom_snack_bar/custom_snack_bar.dart';

class GrageCar extends StatelessWidget {
  const GrageCar({super.key});

  @override
  Widget build(BuildContext context) {
    return     BlocProvider(
    create:(context)=> CarSGrageCubit(sl<GrageCarRepoImpl>())..getCarSGrageData()..getBrand()..pageination(),

    child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<CarSGrageCubit, CarSGrageState>(
          listener: (context, state) {},
          builder: (context, state) {
            CarSGrageCubit cubit = CarSGrageCubit.get(context);
            if (cubit.carGrageModel != null && cubit.brandsModel != null) {
              return BlocConsumer<FavouriteCubit, FavouriteState>(
                listener: (context, state) {
                  if (state is ToggleFavouriteLoadingState) {
                    print("Amr");
                    cubit.carGrageModel!.data![state.index].favorite =
                    !cubit.carGrageModel!.data![state.index].favorite!;
                  }
                  if (state is ToggleFavouriteSuccessState) {
                    // if(  cubit.carGrageModel!.data![state.index].favorite!)
                    // {
                    //   // FavouriteCubit.get(context).getProductFavouriteModel!.data!.add(cubit.getProductModel!.data![state.index]);
                    // }
                    customSnackBar(message: "Add Favourite Successfully".tr(),
                        snackBarType: SnackBarType.success, context: context);
                  } else if (state is ToggleFavouriteErrorState) {
                    cubit.carGrageModel!.data![state.index].favorite = !cubit
                        .carGrageModel!.data![state.index].favorite!;
                    customSnackBar(message: state.error,
                        snackBarType: SnackBarType.error, context: context);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                        [
                          SizedBox(),
                          SizedBox(),
                          Text("Grage Car".tr(), style: TextStyleManager.textStyle18w700,
                          ),


                          Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(height: 40.h,
                              child: CustomTextButton(

                                onPressed: ()
                                {
                                  CarSGrageCubit.get(context).searchController.clear();
                                  // CarSGrageCubit.get(context).selectBrandId = null;
                                  CarSGrageCubit.get(context).page =1;
                                  CarSGrageCubit.get(context).getCarSGrageData(
                                  );
                                },
                                text: "Reset".tr()
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children:
                        [
                           Expanded(
                            flex: 2,
                            child: CustomTextFormField(
                                textHint: "Search".tr(),
                                controller: cubit.searchController,
                                prefixIcon: Icons.search,
                              onEditingComplete: ()
                              {
                                CarSGrageCubit.get(context).page =1;
                                cubit.getCarSGrageData(
                                    handle: cubit.searchController.text ,
                                brandId: cubit.selectBrandId
                                );
                              },
                            ),
                          ) ,
                          SizedBox(width: 10.w,),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              style: TextStyleManager.textStyle12w500.copyWith(color: ColorsManager.primaryColor),
                              isExpanded: true,
                              hint:  Text(TextManager.brand.tr()),
                              value: cubit.selectBrandsModel,
                              onChanged: ( value)
                              {
                                cubit.selectBrandId = value  as int;
                                // cubit.getCarSGrageData(brandId: cubit.selectBrandsModel!.id!.toInt());
                              },
                              items: cubit.brandsModel!.data!.map((e)
                              {
                                return DropdownMenuItem(
                                  child: FittedBox(child: Text(e.name!)),
                                  value: e.id,
                                );
                              }).toList(),
                            ),
                          ),

                        ],
                      ),
                       SizedBox(height: 10.h,),
                      Expanded(
                        child: AnimationLimiter(
                          child: ListView.separated(
                            controller: cubit.scrollController,
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,

                                    child: FadeInAnimation(
                                      child: CustomCarCard(
                                        baseGrageModel: cubit.carGrageModel!.data![index] ,
                                        onTap: ()
                                        {
                                          FavouriteCubit.get(context)
                                              .toggleProductFavourite(
                                              cubit.carGrageModel!.data![index].id!
                                                  .toInt(), index,
                                              type: "car"
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const Divider(),
                              itemCount: cubit.carGrageModel!.data!.length),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else if (state is GetCarSGrageLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ),
);
  }
}

