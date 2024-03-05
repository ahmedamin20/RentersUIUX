import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/resource/text_style_manager.dart';
import '../../../../component/app_button.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/image_path.dart';
import '../order_details/order_details.dart';

class BuildListViewInProgressItem extends StatelessWidget {
  const BuildListViewInProgressItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 8),
      child: Container(
        padding: const EdgeInsets.only(
          top: 7,
          left: 12,
          right: 12,
          bottom: 12,
        ),
        decoration: ShapeDecoration(
          color: AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0A121212),
              blurRadius: 16,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Request number: ',
                          style: TextStyleManager.textStyle12w700,
                        ),
                        TextSpan(
                          text: '124116',
                          style: TextStyleManager.textStyle12w700,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8.5),
                    decoration: BoxDecoration(
                      color: AppColors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("In Progress",style:TextStyleManager.textStyle12w700.copyWith(color: Colors.white),),
                  )
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Date: ',
                      style: TextStyleManager.textStyle12w700,
                    ),
                    TextSpan(
                      text: '26-12-202',
                      style: TextStyleManager.textStyle12w700,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Method: ',
                      style: TextStyleManager.textStyle12w700,
                    ),
                    TextSpan(
                      text: 'Online',
                      style: TextStyleManager.textStyle12w700,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14,),
              AppButton(text: "Request details", onTap: ()
              {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderDetails()));
              })

            ],
          ),
        ),

      ),
    );;
  }
}
