import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/constants.dart';

import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/model/get_product_detiales_model/get_product_detiles_model.dart';
import 'package:ksb/view_model/cubit/information_cubit/information_cubit.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/details/custom_details_app_bar.dart';
import 'package:ksb/views/pages/details/details_body.dart';
import 'package:ksb/views/pages/details/details_table.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../view_model/cubit/product_cubit/product_cubit.dart';

class DetailsView extends StatelessWidget {
  final int id;

  const DetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body:  SafeArea(
            child: state is ProductDetilesLoading ?
              const Center(child: CircularProgressIndicator(),) :
            ProductCubit.get(context).getProductDetilesModel!=null?
             CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers:
              [
                DetailsCustomAppBar(
                  image:  ProductCubit.get(context).getProductDetilesModel!.data!.images!.map((e) => e.url).toList(),
                  function: () {},
                  name: ProductCubit.get(context).getProductDetilesModel!.data!.name!,
                  favourite: ProductCubit.get(context).getProductDetilesModel!.data!.favorite!,
                ),
                DetailsBody(details:
                ProductCubit.get(context).getProductDetilesModel!.data!.description!
                ),
                 DetailsTable(carModels:  ProductCubit.get(context).getProductDetilesModel!.data!.carModels!),
              ],
            ) : const Center(child: Text("Error"),)
          ),
          bottomNavigationBar:   ProductCubit.get(context).getProductDetilesModel!=null?
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            height: 80.h,
            width: MediaQuery
                .sizeOf(context)
                .width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
            [
              FittedBox(
                // flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextManager.price.tr(),
                      style: TextStyleManager.textStyle12w500
                          .copyWith(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.graySimiDark),
                    ),
                    Text(
                      "$curreny ${ProductCubit.get(context).getProductDetilesModel!.data!.sellingPrice!}",
                      style: TextStyleManager.textStyle12w500
                          .copyWith(color: LayoutCubit.get(context).isDark?ColorsManager.white:ColorsManager.grayDark),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150.w,
                // flex: 1,
                child: CustomElevatedButton(
                  text: TextManager.call.tr(),
                  onPressed: ()
                  {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text("Call"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children:
                            List.generate(
                                InformationCubit.get(context).getInfoDataModel!.data!.phones!.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: CustomElevatedButton(
                                      onPressed: () async
                                      {
                                        Navigator.pop(context);
                                        final Uri smsLaunchUri = Uri(
                                          scheme: 'tel',
                                          path: InformationCubit.get(context).getInfoDataModel!.data!.phones![index],
                                        );
                                        launchUrl(smsLaunchUri);
                                      }
                                      ,text: InformationCubit.get(context).getInfoDataModel!.data!.phones![index]

                                      ),
                                    )
                        )),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: const Text("Cancel")),
                          // TextButton(onPressed: () async
                          // {
                          //   Navigator.pop(context);
                          //   final Uri smsLaunchUri = Uri(
                          //     scheme: 'tel',
                          //     path: InformationCubit.get(context).getInfoDataModel!.data!.phones![index],
                          //   );
                          //   launchUrl(smsLaunchUri);
                          // }, child: Text("Call")),
                        ],
                      );

                    },);
                    // final Uri smsLaunchUri = Uri(
                    //   scheme: 'tel',
                    //   path: InformationCubit.get(context).getInfoDataModel!.data!.phones!,
                    //
                    // );
                    // launchUrl(smsLaunchUri);
                  },
                ),
              )
            ]),
          ) : const SizedBox.shrink(),
        );
      },
    );
  }
}
