
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';

import '../../../../../../core/resource/text_manager.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../../../core/services/app_router.dart';
import '../../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../view_model/cubit/home_cubit/home_cubit.dart';
import '../../../../componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'custom_tab_category_recommended_screen.dart';
import 'custom_tap_category.dart';

class RecommendedScreen extends StatefulWidget {
  const RecommendedScreen({super.key});

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sl<CategoryCubit>().getCategory();
    return Scaffold(
      appBar: const CustomAppBar(title:TextManager.recommended),
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
        //  const CustomTabCategoryRecommendedScreen(),
          SizedBox(
            height: 15.h,
          ),
          BlocConsumer<HomeCubit,HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              HomeCubit   cubit = HomeCubit.get(context);
              return (state is HomeLoading )?const CustomCardShimmer(
                scrollDirection: Axis.vertical,
                number: 1,
                length: 10,
              )
                  :(cubit.showAllBranchModel!=null)?
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children:List.generate(cubit.showAllBranchModel!.data!.length, (index) => InkWell(
                    onTap: ()
                    {
                      context.push((AppRouter.detailsRecommendedScreen));
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
                ),
              ):(state  is HomeError)?Center(child: Text(state.message)):SizedBox();
            },

          ),
        ],
      ),
    );
  }
}

//Expanded(
//             child: GridView.count(
//               crossAxisCount: 2,
//               children: List.generate(
//                   10,
//                   (index) => InkWell(
//                         onTap: () {
//                           context.push((AppRouter.detailsRecommendedScreen));
//                         },
//                         child: Column(
//                           children: [
//                             Image.asset('assets/images/eat.png'),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 112.w,
//                                   child: Text(
//                                     'McDonalds',
//                                     style: TextStyleManager.textStyle14w500,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Image.asset('assets/icons/star.png'),
//                                      SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     const Text('5.5')
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       )),
//             ),
//           )