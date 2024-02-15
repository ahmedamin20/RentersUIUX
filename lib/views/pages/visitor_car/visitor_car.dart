import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/repository/visite_history_repo/visit_history_repo.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/view_model/cubit/visitor_car_cubit/visitor_car_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/service_locator/service_locator.dart';
import '../../../data/repository/visitor_car_repo.dart';
import '../../componants/custom_card_shimmer/custom_card_shimmer.dart';
import '../../componants/custom_empty_data/custom_empty_data.dart';
import '../../componants/custom_error_widget/custom_error_widget.dart';
import '../../componants/custom_text_form_field.dart';

class VisitorCar extends StatelessWidget {
  const VisitorCar({super.key});

  @override
  Widget build(BuildContext context) {
    Color color=LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.blackColor;
    return BlocProvider.value(
  value:  VisitorCarCubit.get(context)..getVisitorCar()..pageination(),
  child: BlocConsumer<VisitorCarCubit, VisitorCarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = VisitorCarCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children:
              [
                SizedBox(height: 10.h,),
                CustomTextFormField(
                  prefixIcon: Icons.search,
                  textHint: "Search".tr(),
                  onEditingComplete: ()
                  {
                    cubit.isSearch = true;
                    cubit.page  = 1;
                    cubit.getVisitorCar();
                  },
                  controller: cubit.searchController,
                  suffixIcon: (cubit.isSearch)?
                  Icons.close:null,
                  changePasswordVisibility: ()
                  {
                    cubit.searchController.clear();
                    cubit.isSearch = false;
                    cubit.page  = 1;
                    cubit.getVisitorCar();
                  },
                ),
                SizedBox(height: 10.h,),

                (state is GetVisitorLoading) ?
                const Expanded(child: CustomCardShimmer()) :
                (VisitorCarCubit.get(context).
                visitorCarModel!=null)
                    ? (VisitorCarCubit.get(context).
                visitorCarModel!.
                data!.isEmpty)?
                const Center(child: CustomEmptyData(),):
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                        controller: VisitorCarCubit.get(context).scrollController,
                        itemBuilder: (context, index)
                        {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 800),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                  
                                  margin: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3), // changes position of shadow
                                        ),
                                      ],

                                      color:LayoutCubit.get(context).isDark? ColorsManager.grayDark:ColorsManager.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children:
                                      [
                                      Row(
                                            children:
                                            [
                                              Text(TextManager.model.tr(),
                                                style:TextStyleManager.textStyle12w700.copyWith(color:color),),
                                              const SizedBox(width: 10,),

                                              Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].carModel!,
                                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color:color),),
                                            ],
                                          ),

                                        const SizedBox(height: 10,),
                                        Row(
                                          children:
                                          [
                                            Text(TextManager.brand.tr(),
                                              style:TextStyleManager.textStyle16w700.copyWith(color: color),),
                                            const SizedBox(width: 10,),

                                            Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].brand!.name!,
                                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color:color),),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),

                                        Row(
                                          children:
                                          [
                                            Text(TextManager.color.tr(),
                                              style:TextStyleManager.textStyle16w700.copyWith(color: color),),
                                            const SizedBox(width: 10,),

                                            Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].color!.name!
                                              ,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Color(int.parse(VisitorCarCubit.get(context).visitorCarModel!.data![index].color!.code!.replaceFirst("#", "0xff")))),),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),

                                        Row(
                                          children:
                                          [
                                            Text("Car License".tr(),
                                              style:TextStyleManager.textStyle16w700.copyWith(color: color),),
                                            const SizedBox(width: 10,),

                                            Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].carLicense!,style:
                                            Theme.of(context).textTheme.bodySmall!.copyWith(color:color),),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),

                                        Row(
                                          children:
                                          [
                                            Text(TextManager.year.tr(),
                                              style:TextStyleManager.textStyle16w700.copyWith(color:color),),
                                            const SizedBox(width: 10,),

                                            Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].modelYear!,style:
                                            Theme.of(context).textTheme.bodySmall!.copyWith(color:color)),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),

                                        Row(
                                          children:
                                          [
                                            Expanded(
                                              child: Text(TextManager.vinNumber.tr(),
                                                style:TextStyleManager.textStyle16w700.copyWith(color:color),),
                                            ),
                                            const SizedBox(width: 10,),

                                            Text(VisitorCarCubit.get(context).visitorCarModel!.data![index].vinNumber!,
                                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color:color),),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }, separatorBuilder: (context, index)
                    {
                      return const SizedBox(height: 10,);
                    }, itemCount: VisitorCarCubit.get(context).visitorCarModel!.data!.length),
                  ),
                ):
                const Center(child:CustomErrorWidget()),

              ],
            ),
          )
        );
      },
    ),
);
  }
}

