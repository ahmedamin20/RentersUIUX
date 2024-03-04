import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/data/model/ads_model/ads_model.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../componants/custom_cached_network_image/custom_cached_network_image.dart';

class ShowDialogAds extends StatelessWidget {
  final AdsDataModel data;

  const ShowDialogAds(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    int discount = int.parse(data.discount!.split('%').first);
    return Dialog(
      child:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 343.w,
          decoration: ShapeDecoration(
            color: const Color(0xFFFFD6D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedNetworkImage(url: data.image!),
              SizedBox(height: 10.h,),
              Text(
                  data.title! ,
                  style: TextStyleManager.textStyle20w600
              ),
              SizedBox(height: 5.h,),
              Text(
                data.description! ,
                style: TextStyleManager.textStyle16w500,
              ),
              SizedBox(height: 5.h,),
              discount>0?
              Text(
                'Discount:${discount
                }%',
                style: TextStyleManager.textStyle20w600,
              ):const SizedBox(),
            ],
          ),
        ),
      ) ,
    );
  }
}
