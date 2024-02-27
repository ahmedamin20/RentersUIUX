import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:ksb/view_model/cubit/ads_cubit/ads_cubit.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
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
                SizedBox(
                  height: 15.h,
                ),
                const CustomAddsHomeView(),
                SizedBox(
                  height: 14.h,
                ),
                BlocConsumer<CategoryCubit, CategoryState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return Text(state.message);
                    } else if (CategoryCubit.get(context).categoryModel !=
                        null) {
                      return SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: CategoryCubit.get(context)
                              .categoryModel!
                              .data!
                              .length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Image(
                                    image: NetworkImage(
                                        CategoryCubit.get(context)
                                            .categoryModel!
                                            .data![index]
                                            .image!
                                            .toString())),
                                Text(CategoryCubit.get(context)
                                    .categoryModel!
                                    .data![index]
                                    .name!)
                              ],
                            );
                          },
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
                SizedBox(
                  height: 14.h,
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
                        return Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: productCubit.productModel!.data!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
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
                                  child: Column(
                                    children: [
                                      Image.network(
                                        productCubit.productModel!.data![index]
                                            .mainImage!,
                                        fit: BoxFit.cover,
                                        height: 100.h,
                                      ),
                                      Text(
                                        productCubit
                                            .productModel!.data![index].name!,
                                        style: TextStyleManager.textStyle16w500
                                            .copyWith(
                                                color:
                                                    ColorsManager.primaryColor),
                                      ),
                                      Text(
                                          '${productCubit.productModel!.data![index].price!.toStringAsFixed(2)} EGP',
                                          style: TextStyleManager
                                              .textStyle14w400
                                              .copyWith(
                                                  color: ColorsManager
                                                      .primaryColor)),
                                    ],
                                  ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
