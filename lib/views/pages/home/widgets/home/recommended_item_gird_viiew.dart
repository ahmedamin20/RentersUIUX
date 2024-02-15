import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';

import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../core/services/app_router.dart';


class RecommendedItemGirdView extends StatelessWidget {
  const RecommendedItemGirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider.value(
        value: HomeCubit.get(context)..scroll(),
        child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit   cubit = HomeCubit.get(context);
            return (state is HomeLoading )?const CustomCardShimmer(
              scrollDirection: Axis.vertical,

              number: 1,
            )
                :(cubit.showAllBranchModel!=null)?
            GridView.count(
              controller: cubit.scrollController,
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children:List.generate(cubit.showAllBranchModel!.data!.length, (index) => InkWell(
                onTap: ()
                {
                  context.push((AppRouter.detailsRecommendedScreen),extra:
                  {
                    'id':cubit.showAllBranchModel!.data![index].storeId
                  });
                },
                child: Column(
                  children: [
                    Image.network(cubit.showAllBranchModel!.data![index].branchLogo!,
                      width: 150.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 112,
                          child: Text(
                            cubit.showAllBranchModel!.data![index].name!,
                            style: TextStyleManager.textStyle14w500,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/icons/star.png'),
                            const SizedBox(width: 10,),
                            Text(cubit.showAllBranchModel!.data![index].ratingAverage.toString())
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              )),
            ):(state  is HomeError)?Center(child: Text(state.message)):const SizedBox();
          },

        ),
      ),
    );
  }
}