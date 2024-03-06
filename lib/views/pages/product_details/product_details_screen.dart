import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: ProductCubit.get(context)..getProductDetails(productId),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
          ),
          body: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {},
            builder: (BuildContext context, ProductState state) {
              ProductCubit productCubit = ProductCubit.get(context);
              if (state is ProductDetailsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (productCubit.productDetails != null) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300.h,
                          child: PageView.builder(
                            itemCount: productCubit
                                .productDetails!.data!.otherImages!.length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                productCubit.productDetails!.data!
                                    .otherImages![index].url!,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Text(productCubit.productDetails!.data!.name!,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.blackColor)),
                            Spacer(),
                            Text(
                                "EGP ${productCubit.productDetails!.data!.price!}",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.blackColor)),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Health : ${productCubit.productDetails!.data!.health}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          "Minimum days : ${productCubit.productDetails!.data!.maximumDays}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Maximum days : ${productCubit.productDetails!.data!.maximumDays}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text("Description"  ,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff06004F))

                        ),
                          SizedBox(
                          height: 12.h,
                        ),
                        Text(productCubit.productDetails!.data!.description!,
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.blackColor)),
                                   SizedBox(
                          height: 12.h,
                        ),

                        
                           A2zCustomButton(buttonName: "Renter", onPressed: (){}),
                      ],
                    ),
                  ),
                );
              } else if (state is ProductDetailsError) {
                return Center(
                  child: Text(state.error),
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
