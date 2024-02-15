import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/add_to_cart_button.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/custom_divider.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/recommended_item_details_App_bar.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/recommended_item_details_widget.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/size_item.dart';

import '../../../../../core/resource/assets_manager.dart';
import '../../../../../core/resource/text_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../core/utils/flutter_toast/flutter_toast.dart';
import '../../../../../view_model/cubit/home_cubit/home_cubit.dart';
import '../../../../componants/custom_easy_loading/custom_easy_loading.dart';
import '../../../../componants/custom_text_form_field.dart';

class RecommendedItemDetailsScreen extends StatelessWidget {
  final String productId;

  const RecommendedItemDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const RecommendedItemDetailsAppBar(),
      body:   CustomScrollView(
        slivers: [
             SliverToBoxAdapter(
            child: RecommendedItemDetailsWidget(productId: productId,),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Divider(height: 1.h,color: ColorsManager.greyScale600,),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 29.h,),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context,state)
          {
            if(state is AddToCartLoading)
            {
              customEasyLoading();

            }
            if(state is AddToCartSuccess)
            {
              EasyLoading.dismiss();

              flutterToastShow(message: state.message, state: ToastState.SUCCESS);

              context.pop();
            }
            if(state is AddToCartError)
            {
              EasyLoading.dismiss();

              flutterToastShow(message: state.message, state: ToastState.ERROR);
            }
          },
          builder: (context,state)
          {
            return Row(
              children: [
                Container(
                  width: 28.67.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.greyScale600
                  ),
                  child:  GestureDetector(
                    onTap: ()
                    {
                      HomeCubit.get(context).changeCountProduct(operator: '-');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(3.0.sp),
                      child:  Icon(Icons.remove,size:20.sp,),
                    ),
                  ),
                ),
                SizedBox(width: 8.3.w,),
                Text(HomeCubit.get(context).countOfProduct.toString(),style: TextStyleManager.textStyle20w500,),
                SizedBox(width: 8.3.w,),
                Container(
                  width: 28.67.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.greyScale600
                  ),
                  child:  GestureDetector(
                    onTap: ()
                    {
                      HomeCubit.get(context).changeCountProduct(operator: '+');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(3.0.sp),
                      child:  Icon(Icons.add,size: 20.sp,),
                    ),
                  ),
                ),
                SizedBox(width: 8.3.w,),
                CustomElevatedButton(
                  width: 230,
                  color: ColorsManager.colorText,
                  text: "${TextManager.addToCart} -${HomeCubit.get(context).totalPrice}",
                  onPressed: ()
                  {

                    if(HomeCubit.get(context).formKey2.currentState!.validate()){
                      HomeCubit.get(context).addToCart(
                          branch_product_id: HomeCubit.get(context).showOneProductModel!.showOneProductData!.id!,
                          DO_NOT_SEND: 'DO_NOT_SEND',);
                      print("validate");
                    }
                    else{
                      print("error");
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
