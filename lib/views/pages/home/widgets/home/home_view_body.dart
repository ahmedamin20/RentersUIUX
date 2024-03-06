import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/model/cart_model/cart_model.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:ksb/view_model/cubit/ads_cubit/ads_cubit.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import '../../../../../core/services/app_router.dart';
import '../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../data/repository/ads_repo/ads_repo.dart';
import 'custom_Adds_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AdsCubit(sl<AdsRepoImpl>())..getAds(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              controller: ProductCubit.get(context).scrollController,
              children: [
                Row(children: 
                [
                  Expanded(
                    child: const CustomTextFormField(
                    
                    textHint: "Search" , 
                                    suffixIcon: Icons.search,
                                    ),
                  ),
                IconButton(
                  onPressed: () {
                    context.push(AppRouter.addProductScreen);
                  },
                  icon: const Icon(Icons.add , 
                  color: ColorsManager.primaryColor,
                  ),
                ),
                ],),
                SizedBox(
                  height: 15.h,
                ),
                const CustomAddsHomeView(),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  TextManager.categories.tr(),
                  style: TextStyleManager.textStyle18w600.copyWith(
                      color: ColorsManager.blackColor),
                ),
                BlocConsumer<CategoryCubit, CategoryState>(
                  listener: (context, state) 
                  {
                  },
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Text(state.message);
                    } else if (CategoryCubit.get(context).categoryModel !=
                        null) {
                      return SizedBox(
                        height: 160.h,
                        width: 100.w,
                        child: ListView.builder(
                          itemCount: CategoryCubit.get(context)
                              .categoryModel!
                              .data!
                              .length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40.r,
                                    backgroundImage: CachedNetworkImageProvider(
                                            CategoryCubit.get(context)
                                                .categoryModel!
                                                .data![index]
                                                .image!
                                                .toString()),
                                  ),
                                  const SizedBox(height: 10,),
                                  SizedBox(
                                    
                                    width: 100.w,
                                    child: Text(
                                      
                                      CategoryCubit.get(context)
                                        .categoryModel!
                                        .data![index]
                                        .name! ,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyleManager.textStyle16w500.copyWith(color: ColorsManager.primaryColor)),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                 Text(
                  TextManager.HpmeData.tr(),
                  style: TextStyleManager.textStyle18w600.copyWith(
                      color: ColorsManager.blackColor),
                ),
                 SizedBox(
                  height: 12.h,
                ),
                BlocProvider.value(
                  value: ProductCubit.get(context)
                    ..scrollListener()
                    ..getProduct(),
                  child: BlocConsumer<ProductCubit, ProductState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      ProductCubit productCubit = ProductCubit.get(context);
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProductError) {
                        return Text(state.error);
                      } else if (productCubit.productModel != null) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: productCubit.productModel!.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.85,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.push(AppRouter.productDetailsScreen,
                                    extra: productCubit
                                        .productModel!.data![index].id);
                              },
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: ColorsManager.primaryColor.withOpacity(0.5),
                                    width: 1,
                                  
                                  )),
                                elevation: 5,
                                child: Column(
                                  children: [
                                   
                                      
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  productCubit
                                                      .productModel!
                                                      .data![index]
                                                      .mainImage!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        
                                        ),
                                      ),
                                      
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:5 , right: 5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: 
                                         [
                                          SizedBox(height: 10.h,),
                                           Text(
                                            productCubit
                                                .productModel!.data![index].name!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                            style: TextStyleManager.textStyle16w500
                                                .copyWith(
                                                    color:
                                                        ColorsManager.primaryColor),
                                          ),
                                          Row(children: 
                                          [
                                            Text(
                                              'EGP ${productCubit.productModel!.data![index].price!.toStringAsFixed(2)}',
                                              style: TextStyleManager
                                                  .textStyle14w400
                                                  .copyWith(
                                                      color: ColorsManager
                                                          .primaryColor)),
                                                          const Spacer(),
                                                       const   CircleAvatar(
                                                        backgroundColor: ColorsManager.primaryColor,
                                                            radius: 14,
                                                            child: Icon(Icons.add ,
                                                            color: ColorsManager.white,
                                                            size: 15,
                                                            ),
                                                          ),
                                        
                                                          
                                          ],)
                                        
                                         ],),
                                      ),
                                    ),
                                   
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
