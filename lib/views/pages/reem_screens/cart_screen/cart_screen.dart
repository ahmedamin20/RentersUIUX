import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/views/pages/reem_screens/component/app_button.dart';
import 'package:ksb/views/pages/reem_screens/core/image_path.dart';

import 'component/cart_listview_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(
      centerTitle: true,
      title: Text(
        TextManager.cart,
        style:TextStyleManager.textStyle18w600.copyWith(fontWeight: FontWeight.w500,color: ColorsManager.darkBlue),
      ),
     ),

      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       SvgPicture.asset(AppImages.shoppingCart),
        SizedBox(height: 24.h,),
        Text(
          TextManager.thereIsNoFood,
          textAlign: TextAlign.center,
          style: TextStyleManager.textStyle16w400
        ),
        SizedBox(height: 24.h,),
        BlocConsumer<LayoutCubit,LayoutState>(
          listener: (context, state) {},
          builder: (context, state) {
            return  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 61.w),
              child: AppButton(text: TextManager.letsDiscover,
                onTap: (){
                  LayoutCubit.get(context).changeBottomNavBar(0);

                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ListViewCartItem()));

              },
                iconData: Icons.arrow_forward,),
            );
          },

        ),

    ],),);
  }
}
