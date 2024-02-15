import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';
import 'package:ksb/views/pages/payment/widget/custom_bottom_sheet.dart';
import 'package:ksb/views/pages/payment/widget/paument_list_view.dart';

import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/text_style_manager.dart';
import '../../componants/custom_elevated_button.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), onPressed: () => context.pop()),
        title: Text(
          TextManager.paymentMethod,
          style: TextStyleManager.textStyle20w500,
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 12.w),
            child: Text(TextManager.edit,style: TextStyleManager.textStyle14w400,),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 32.h,),
          const PaymentListView(),
        ],
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h),
        child: CustomElevatedButton(text: TextManager.addNewCard,
          onPressed: (){
          // context.push((pushTo));
            showModalBottomSheet(
                context: context,
                builder: (context){
              return const CustomBottomSheet();
            },
            );
        }
        ,),
      ),
    );
  }
}
