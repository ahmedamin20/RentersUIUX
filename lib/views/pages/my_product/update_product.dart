import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/data/model/product_model/product_model.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:ksb/views/componants/custom_easy_loading/custom_easy_loading.dart';
import 'package:ksb/views/componants/custom_icon_button.dart';
import '../../../core/resource/colors_manager.dart';
import '../../../data/model/category_model/category_model.dart';
import '../../../view_model/cubit/update_product_cubit/cubit/add_product_screen_cubit.dart';
import '../../componants/a2z_custom_button.dart';
import '../../componants/custom_text_form_field.dart';

class UpdateProduct extends StatefulWidget {
  final BaseProductModel productModel;
  const UpdateProduct({super.key, required this.productModel});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  UpdateProductScreenCubit cubit = UpdateProductScreenCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.productModel.name!);
    // cubit.nameController.text = widget.productModel.name!;
    // cubit.priceController.text = widget.productModel.price.toString();
    // cubit.descriptionController.text = widget.productModel.description!;
    // cubit.minimumDays.text = widget.productModel.minimumDays.toString();
    // cubit.maximumDays.text = widget.productModel.maximumDays.toString();
    // cubit.health.text = widget.productModel.health.toString();
    cubit.getProductDetails(widget.productModel.id!.toInt());
  }

  bool addNewImage = false;

  List<int> deletImage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
        ),
        body: BlocConsumer<UpdateProductScreenCubit, UpdateProductScreenState>(
          bloc: cubit,
          listener: (context, state) {
            if (state is GetProductDetailsLoading) {
              customEasyLoading();
            } else if (state is GetProductDetailsSuccess) {
              // cubit.otherImages =  state.productDetails.data.otherImages;
              // cubit.mainImage = state.productModel.mainImage;
              cubit.nameController.text = state.productDetails.data!.name!;
              cubit.priceController.text =
                  state.productDetails.data!.price.toString();
              cubit.descriptionController.text =
                  state.productDetails.data!.description!;
              cubit.minimumDays.text =
                  state.productDetails.data!.minimumDays.toString();
              cubit.maximumDays.text =
                  state.productDetails.data!.maximumDays.toString();
              cubit.health.text = state.productDetails.data!.health.toString();

              EasyLoading.dismiss();
            } else if (state is GetProductDetailsError) {
              EasyLoading.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: ColorsManager.redColor,
                ),
              );
            }
            if (state is AddProductScreenSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("update product successfuly"),
                backgroundColor: ColorsManager.green,
              ));
              Navigator.pop(context, true);
            } else if (state is AddProductScreenError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: ColorsManager.redColor,
                ),
              );
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  // add Image
                  const Text(
                    "Main Image",
                  ),

                  !addNewImage
                      ? Center(
                          child: Stack(
                            children: [
                              Image(
                                image: NetworkImage(
                                    widget.productModel.mainImage!),
                              ),
                              IconButton(
                                  onPressed: () {
                                    addNewImage = true;
                                    setState(() {});
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        )
                      : cubit.mainImage == null
                          ? Column(
                              children: [
                                // restore old image
                                IconButton(
                                    icon: const Icon(
                                      Icons.restore,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      addNewImage = false;
                                      setState(() {
                                        cubit.mainImage = null;
                                      });
                                    }),

                                InkWell(
                                  onTap: () {
                                    cubit.pickImage();
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    color: Colors.grey,
                                    child: const Center(
                                        child: Text(
                                      "Add Image",
                                    )),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.restore,
                                      color: Colors.green,
                                    ),
                                    onPressed: () {
                                      addNewImage = false;
                                      setState(() {
                                        cubit.mainImage = null;
                                      });
                                    }),
                                InkWell(
                                    onTap: () {
                                      cubit.pickImage();
                                    },
                                    child: Image.file(
                                        File(cubit.mainImage!.path))),
                              ],
                            ),

                  const SizedBox(
                    height: 10,
                  ),

                  BlocConsumer<CategoryCubit, CategoryState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      CategoryCubit categoryCubit =
                          context.read<CategoryCubit>();
                      return DropdownButton<BaseCategoryModel>(
                        onChanged: (value) {
                          setState(() {
                            cubit.categpryID = value;
                          });
                        },
                        value: cubit.categpryID?.name == null
                            ? null
                            : cubit.categpryID,
                        items: context
                            .read<CategoryCubit>()
                            .categoryModel!
                            .data!
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name!),
                                ))
                            .toList(),
                      );
                    },
                  ),

                  // InkWell(
                  //   onTap: () {
                  //     cubit.pickImageMutiImage();
                  //   },
                  //   child: Text(
                  //     "Current images",
                  //     style: TextStyle(
                  //         fontSize: 20.sp,
                  //         fontWeight: FontWeight.bold,
                  //         color: ColorsManager.blackColor),
                  //   ),
                  // ),

                  // cubit.productDetails != null
                  //     ? SizedBox(
                  //         height: 200.h,
                  //         width: 500.w,
                  //         child: ListView.builder(
                  //             scrollDirection: Axis.horizontal,
                  //             itemCount: cubit
                  //                 .productDetails!.data!.otherImages!.length,
                  //             itemBuilder: (context, index) {
                  //               return Padding(
                  //                   padding: const EdgeInsets.all(8.0),
                  //                   child: InkWell(
                  //                       onTap: () {
                  //                         setState(() {
                  //                           deletImage.add(cubit.productDetails!
                  //                               .data!.otherImages![index].id!
                  //                               .toInt());

                  //                           cubit.productDetails!.data!
                  //                               .otherImages!
                  //                               .removeAt(index);
                  //                         });
                  //                       },
                  //                       child: Image(
                  //                         image: NetworkImage(cubit
                  //                             .productDetails!
                  //                             .data!
                  //                             .otherImages![index]
                  //                             .url!),
                  //                       )));
                  //             }),
                  //       )
                  //     : SizedBox(),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Name Product",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.blackColor)),
                  SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "price Product",
                    controller: cubit.nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Price Product",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "Price Product",
                    controller: cubit.priceController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Description Product",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blackColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "description ",
                    controller: cubit.descriptionController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Minimum Days",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "Minimum Days",
                    controller: cubit.minimumDays,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Maximum Days",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "Maximum Days",
                    controller: cubit.maximumDays,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Health",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.blackColor)),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomTextFormField(
                    textHint: "Health",
                    controller: cubit.health,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  A2zCustomButton(
                    buttonName: "Update Product",
                    onPressed: () {
                      cubit.sendData(deletImage, addNewImage,
                          widget.productModel.id!.toInt());
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
