import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../view_model/cubit/category_cubit/category_cubit.dart';
import '../../../../componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'custom_tap_category.dart';

class CustomTabCategoryRecommendedScreen extends StatelessWidget {
  const CustomTabCategoryRecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CategoryCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              height: 32.h,
              child:
              cubit.categoryModel != null
                  ?  ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      CustomTabCategory(
                        title: cubit.categoryModel!.data![index].name!,
                        image: cubit.categoryModel!.data![index].image!,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                  itemCount:
                  cubit.categoryModel!.data!.length)
                  :
              CustomCardShimmer(
                number: 2,
                scrollDirection: Axis.horizontal,
                width: 100.w,
                height: 32.h,
              )
          ),
        );
      },
    );
  }
}
