import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/data/model/payment_model/payment_model.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../data/model/language_model/language_model.dart';
import '../../../../view_model/cubit/profile_cubit/profile_cubit.dart';
import '../../profile/widget/language_item.dart';
import 'delivery_address_item.dart';

class DeliveryItemListView extends StatelessWidget {
  const DeliveryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<PaymentModel> paymentListItem=[
      PaymentModel(name: 'Current address', image: AssetsManager.gps,description: 'Doyers str. 206' ),
      PaymentModel(name: 'Home', image: AssetsManager.gps,description: 'NYC, Broadway ave 79' ),
      PaymentModel(name: 'Work', image: AssetsManager.gps,description: 'St. Mark’s Place Business Plaza 18' ),
      PaymentModel(name: 'Park Avenue 15', image: AssetsManager.gps, ),
      PaymentModel(name: 'Washington str. 58/105', image: AssetsManager.gps, ),
    ];
    return Padding(
      padding:  EdgeInsets.only(top: 32+8.h),
      child: ListView.builder(
          itemCount: paymentListItem.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return  InkWell(
              onTap: (){
                ProfileCubit.get(context).changeLanguage(index);
              },
              child: DeliveryItem(
                paymentName: paymentListItem[index]!.name,
                image: paymentListItem[index]!.image, index: index,
                description: paymentListItem[index]!.description ,
              ),
            );
          },


          ),
    );
  }
}
