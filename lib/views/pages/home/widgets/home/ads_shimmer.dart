import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/resource/colors_manager.dart';
import '../../../../componants/custom_cached_network_image/custom_cached_network_image.dart';

class CustomAdsShimmer extends StatelessWidget {
  const CustomAdsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context,index){
        return  SizedBox(
          child:  Shimmer.fromColors(
            baseColor: ColorsManager.primaryColor,
            highlightColor: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 343.w,
              height: 170.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFFFD6D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 15.h,),
                      const SizedBox(
                        width: 108,
                        child: Text(
                          '' ,
                          style: TextStyle(
                            color: Color(0xFF222B45),
                            fontSize: 20,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(onPressed: (){},
                          style:ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFD6D9)
                          ) ,
                          child: const Row(
                            children: [
                              Text(
                                'More',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward_rounded)
                            ],
                          ))
                    ],
                  ),
                  SizedBox(width: 40.w,),
                  const Expanded(child: CustomCachedNetworkImage(url:''))
                ],
              ),
            ),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(width: 10.w,);
    },);

  }
}
