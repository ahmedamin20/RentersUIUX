import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/product_user_cubit/product_user_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';

import '../../../core/resource/text_style_manager.dart';
import '../../../core/services/app_router.dart';
import 'update_product.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductUserCubit()
          ..getProduct()
          ..scrollListener(),
        child: Scaffold(
          floatingActionButton:
              BlocConsumer<ProductUserCubit, ProductUserState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () async {
                  var value = await context.push(AppRouter.addProductScreen);
                  if (value != null) {
                    ProductUserCubit productCubit =
                        ProductUserCubit.get(context);
                    productCubit.getProduct();
                  }
                },
                backgroundColor: ColorsManager.primaryColor,
                child: const Icon(Icons.add),
              );
            },
          ),
          appBar: AppBar(
            title: const Text('My Product'),
          ),
          body: BlocConsumer<ProductUserCubit, ProductUserState>(
            listener: (context, state) {
              if (state is ProductError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              } else if (state is ProductDeleteLoading) {
                customEasyLoading();
              } else if (state is ProductDeleted) {
                ProductUserCubit productCubit = ProductUserCubit.get(context);
                productCubit.getProduct();
                EasyLoading.dismiss();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Product Deleted Successfully')));
              } else if (state is ProductDeleteError) {
                EasyLoading.dismiss();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              ProductUserCubit productCubit = ProductUserCubit.get(context);
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductError) {
                return Text(state.error);
              } else if (productCubit.productModel != null) {
                return GridView.builder(
                  controller: productCubit.scrollController,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productCubit.productModel!.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRouter.productDetailsScreen,
                            extra: productCubit.productModel!.data![index].id);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorsManager.primaryColor.withOpacity(0.5),
                              width: 1,
                            )),
                        elevation: 5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          productCubit.productModel!
                                              .data![index].mainImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Column(
                                      children: [
                                        IconButton(
                                          icon: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Delete Product'),
                                                  content: Text(
                                                    'Are you sure you want to delete this product?',
                                                    style: TextStyle(
                                                        color: ColorsManager
                                                            .primaryColor,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        productCubit
                                                            .deleteProduct(
                                                                productCubit
                                                                    .productModel!
                                                                    .data![
                                                                        index]
                                                                    .id!
                                                                    .toInt());
                                                        GoRouter.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('Yes',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        GoRouter.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('No',
                                                          style: TextStyle(
                                                              color: ColorsManager
                                                                  .primaryColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                            // productCubit.deleteProduct(productCubit.productModel!.data![index].id!);
                                          },
                                        ),
                                        IconButton(
                                          icon: const CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            ),
                                          ),
                                          onPressed: () async {
                                            var value = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateProduct(
                                                          productModel:
                                                              productCubit
                                                                  .productModel!
                                                                  .data![index],
                                                        )));

                                            if (value != null) {
                                              ProductUserCubit productCubit =
                                                  ProductUserCubit.get(context);
                                              productCubit.getProduct();
                                            }

                                            // productCubit.deleteProduct(productCubit.productModel!.data![index].id!);
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
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
                                    Row(
                                      children: [
                                        Text(
                                            'EGP ${productCubit.productModel!.data![index].price!.toStringAsFixed(2)}',
                                            style: TextStyleManager
                                                .textStyle14w400
                                                .copyWith(
                                                    color: ColorsManager
                                                        .primaryColor)),
                                        const Spacer(),
                                        const CircleAvatar(
                                          backgroundColor:
                                              ColorsManager.primaryColor,
                                          radius: 14,
                                          child: Icon(
                                            Icons.add,
                                            color: ColorsManager.white,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
        ));
  }
}
