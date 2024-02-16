import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/location_cubit/location_cubit.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:ksb/views/pages/home/widgets/home/recommended_item_gird_viiew.dart';
import 'package:ksb/view_model/cubit/ads_cubit/ads_cubit.dart';
import '../../../../../core/services/app_router.dart';
import '../../../../../core/services/service_locator/service_locator.dart';
import '../../../../../data/repository/ads_repo/ads_repo.dart';
import 'custom_Adds_home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().getLocation();
    return BlocProvider(
      create: (BuildContext context) =>AdsCubit(sl<AdsRepoImpl>())
        ..getAds(),
      child: Scaffold(
        body: Column(
          children: [
             SizedBox(height: 15.h,),
            const CustomAddsHomeView(),
            SizedBox(height: 14.h,),
            InkWell(
               onTap: ()
               {
                   context.push((AppRouter.recommendedScreen),);
               },
               child: Padding(
                padding: const EdgeInsets.only(left: 14,right: 12,bottom: 12),
                child: Row(
                  children: [
                    Text(
                      TextManager.recommended.tr(),
                      style: TextStyleManager.textStyle16w500
                    ),
                    const Spacer(),
                    Text(
                      TextManager.viewAll.tr(),
                      textAlign: TextAlign.right,
                      style: TextStyleManager.textStyle14w400.copyWith(color: const Color(0xFF8F9BB3)),
                    )
                  ],
                ),
                           ),
             ),
            const RecommendedItemGirdView(),
          ],
        ),
      ),
    );
  }
}
