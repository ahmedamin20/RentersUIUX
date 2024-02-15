
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/data/model/model_lanageuages/language_model.dart';
import 'package:ksb/data/model/payment_model/payment_model.dart';
import 'package:ksb/data/model/payment_model/payment_model.dart';
import 'package:ksb/data/model/payment_model/payment_model.dart';
import 'package:ksb/data/model/profile_ui_model/profile_ui_model.dart';
import 'package:ksb/views/pages/payment/widget/payment_item.dart';

import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/app_router.dart';
import '../../../../view_model/cubit/profile_cubit/profile_cubit.dart';
import '../../../componants/a2z_custom_button.dart';
import '../../../componants/custom_elevated_button.dart';
import 'delete_card_bottom_Sheet.dart';

class PaymentListView extends StatelessWidget {
  const PaymentListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<PaymentModel> paymentListItem=[
      PaymentModel(name: 'Payoneer', image: AssetsManager.payment,description: 'Mastercard **** 7890' ),
      PaymentModel(name: 'Transfer wise', image: AssetsManager.visa,description: 'Visa card **** 7890'),
      PaymentModel(name: 'Cash', image: AssetsManager.cash,),

    ];
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: paymentListItem.length,
      itemBuilder: ((context, index) {
        return Slidable(
          endActionPane: ActionPane(
            extentRatio: .25,
              motion: const ScrollMotion(),
              children: [
                SvgPicture.asset(AssetsManager.edit2),
                SizedBox(width: 24.w,),
                InkWell(
                    onTap: (){
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context, builder: (context){
                        return const DeleteCardBottomSheet();
                      });

                    },
                    child: SvgPicture.asset(AssetsManager.delete2)),

              ]
          ),
          child: InkWell(
            onTap: (){
              ProfileCubit.get(context).changeLanguage(index);

            },
            child: PaymentItem(
              paymentName: paymentListItem[index].name,
              description:  paymentListItem[index].description, image:  paymentListItem[index].image,
              index: index,
            ),
          ),
        );
      }), separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 32.h,);
    },);
  }
}
