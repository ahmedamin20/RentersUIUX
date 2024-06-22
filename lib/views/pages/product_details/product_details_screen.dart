import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/caching_data/cacshing_date.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/product_cubit/product_cubit.dart';
import 'package:ksb/view_model/cubit/requests_cubit/requests_cubit.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.productId, required this.userID});

  final int productId;
  final int userID;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String fromDate = '';

  String toDate = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: ProductCubit.get(context)..getProductDetails(widget.productId),
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
                          child: Image.network(
                            productCubit.productDetails!.data!.mainImage!,
                            fit: BoxFit.cover,
                          ),
                          // child: PageView.builder(
                          //   itemCount: productCubit
                          //       .productDetails!.data!.otherImages!.length,
                          //   itemBuilder: (context, index) {
                          //     return Image.network(
                          //       productCubit.productDetails!.data!
                          //           .otherImages![index].url!,
                          //       fit: BoxFit.cover,
                          //     );
                          //   },
                          // ),
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
                        SizedBox
                        (
                          height: 14.h,
                        ),
                        Text(
                          "Mindays : ${productCubit.productDetails!.data!.minimumDays}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Max days : ${productCubit.productDetails!.data!.maximumDays}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text("Description",
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff06004F))),
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
                        Text(
                          "From : ${fromDate.split(' ')[0]}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "To : ${toDate.split(' ')[0].toString()}",
                          style: TextStyle(
                              fontSize: 20.sp, color: ColorsManager.blackColor),
                        ),
                        (CachingData.instance.getCachedLogin()!.data!.id !=
                                widget.userID)
                            ? BlocConsumer<RequestsCubit, RequestsState>(
                                listener: (context, state) {
                                  if (state is MakeOrderRequestLoading) {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text('Rent'),
                                          content: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        );
                                      },
                                    );
                                  } else if (state is MakeOrderRequestSuccess) {
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Order has been made'),
                                      ),
                                    );
                                  } else if (state is MakeOrderRequestError) {
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(state.message),
                                      ),
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      A2zCustomButton(
                                          buttonName: "Select Date",
                                          onPressed: () {
                                            showDateRangePicker(
                                                    context: context,
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.now()
                                                        .add(const Duration(
                                                            days: 30)))
                                                .then((value) {
                                              setState(() {
                                                fromDate =
                                                    value!.start.toString();
                                                toDate = value.end.toString();
                                              });
                                            });
                                          }),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      A2zCustomButton(
                                          buttonName: "Renter",
                                          onPressed: () {
                                            if (fromDate.isNotEmpty &&
                                                toDate.isNotEmpty) {
                                              RequestsCubit.get(context)
                                                  .makeOrder(
                                                      productCubit
                                                          .productDetails!
                                                          .data!
                                                          .id!
                                                          .toInt(),
                                                      fromDate.split(' ')[0],
                                                      toDate.split(' ')[0]);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Please select date'),
                                              ));
                                            }
                                          }),
                                    ],
                                  );
                                },
                              )
                            : SizedBox()
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
