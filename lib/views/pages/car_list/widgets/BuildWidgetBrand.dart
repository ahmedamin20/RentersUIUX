import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/view_model/cubit/brand_cubit/brand_cubit.dart';

import '../../../../core/services/service_locator/service_locator.dart';
import '../../../../data/repository/brand_repo/brand_repo.dart';
import 'build_brand_item.dart';
class BuildWidgetBrand extends StatelessWidget
{
  const BuildWidgetBrand({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<BrandCubit>(create: (context) {
      return BrandCubit(sl<BrandRepoImpl>())..getBrand()..onScroll();
    },
    child: BlocConsumer<BrandCubit, BrandState>(
      listener: (context, state) {


  },
    builder: (context, state) {
      return state is BrandLoading
          ? const Center(child: CircularProgressIndicator())
          : state is BrandSuccess
              ? SizedBox(
         height: 100.h,

                child: ListView.separated
                  (
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: BrandCubit.get(context).scrollController,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: ()
                      {
                        print("sd");
                        context.push(AppRouter.bandScreen ,
                        extra: {
                          "id":BrandCubit.get(context).brandModel!.data![index].id,
                          "brandName":BrandCubit.get(context).brandModel!.data![index].name,
                        }
                        );
                      },
                      child: BuildBrandItem(
                        baseBrandModel:
                          BrandCubit.get(context).brandModel!.data![index]),
                    ),
                    separatorBuilder: (context, index) =>  SizedBox(
                          width: 10.w,
                        ),
                    itemCount: BrandCubit.get(context).brandModel!.data!.length),
              )
              : const Center(child: CircularProgressIndicator());
    },
    ),
    );
  }
}
