import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../data/repository/ads_repo/ads_repo.dart';
import '../../../../view_model/cubit/ads_cubit/ads_cubit.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
      AdsCubit(sl<AdsRepoImpl>())
        ..getAds(),
      child: BlocConsumer<AdsCubit, AdsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  Scaffold(
            body: state is AdsLoading
                ? const Center(child: CircularProgressIndicator())
                : state is AdsSuccess
                ? PageView.builder(
              itemCount: state.adsModel.data!.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context , index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
              height: 300.h,

              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children:
                [
                  Image.network(
                        state.adsModel.data![index].
                        image!,
                        fit: BoxFit.cover,
                  ),
                   Positioned(
                      bottom: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        padding: const EdgeInsets.all(8),
                        decoration:  BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                  [
                    Text( state.adsModel.data![index].title! ,
                    style: TextStyleManager.textStyle18w700.copyWith(
                      color: ColorsManager.white
                    ),
                    ),
                    Text( state.adsModel.data![index].description! ,
                      style: TextStyleManager.textStyle16w500.copyWith(
                          color: ColorsManager.white
                      )),

                    Text( state.adsModel.data![index].discount! ,
                      style: TextStyleManager.textStyle16w500.copyWith(
                          color: ColorsManager.white
                      ))
                  ],),
                      )),

                ],
              ),
            );
                  }
                )
                : const Center(child: Text("Error"),),
          );
        },
      ),
    );
  }
}
