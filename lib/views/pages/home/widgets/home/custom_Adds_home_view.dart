import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/pages/home/widgets/home/show_dialog_ads.dart';

import '../../../../../core/resource/colors_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../view_model/cubit/ads_cubit/ads_cubit.dart';
import '../../../../componants/custom_cached_network_image/custom_cached_network_image.dart';
import '../../../../componants/custom_card_shimmer/custom_card_shimmer.dart';

class CustomAddsHomeView extends StatelessWidget {
  const CustomAddsHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsCubit,AdsState>(
      buildWhen: (previous, current) =>
      current is AdsLoading || current is AdsSuccess || current is AdsError,
      listener: (context,state){},
      builder: (context,state){
        return state is AdsLoading?
        SizedBox(
            height: 170.h,
            width: 343.w,
            child: const  CustomCardShimmer(
              number: 2,scrollDirection: Axis.horizontal,
              width: 343,
              height: 170,
            )):
        state is AdsSuccess?
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.adsModel.data!.length,
            itemBuilder: (context,index){
              return  InkWell(
                onTap: (){
                  //
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShowDialogAds(state.adsModel.data![index]);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 343.w,
                  height: 170.h,
                  decoration: ShapeDecoration(
                    color: ColorsManager.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 15.h,),
                          SizedBox(
                            width: 108.w,
                            child: Text(
                              state.adsModel.data![index].title! ,
                              style:  TextStyleManager.textStyle20w600.copyWith(color: Colors.white)
                            ),
                          ),
                          // const Spacer(),
                          // ElevatedButton(
                          //     onPressed: (){},
                          //     style:ElevatedButton.styleFrom(
                          //         backgroundColor: ColorsManager.white2,
                          //     ) ,
                          //     child:   Row(
                          //       children: [
                          //         Text(
                          //           'More',
                          //           style: TextStyleManager.textStyle14w500
                          //         ),
                          //         const SizedBox(width: 5,),
                          //         const Icon(Icons.arrow_forward_rounded)
                          //       ],
                          //     ))
                        ],
                      ),
                      SizedBox(width: 40.w,),
                      Expanded(child: CustomCachedNetworkImage(url: state.adsModel.data![index].image!))
                    ],
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10.w,);
          },),
        ):
        const Center(child: Text("Error"),);

      },
    );
  }
}
