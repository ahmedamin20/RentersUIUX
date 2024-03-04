import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/view_model/cubit/cart_cubit/cart_cubit.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'package:ksb/views/pages/reem_screens/cart_screen/cart_screen.dart';
import 'package:ksb/views/pages/reem_screens/component/app_button.dart';

import '../../../../../core/services/app_router.dart';
import '../../core/app_colors.dart';

class ListViewCartItem extends StatefulWidget {
  const ListViewCartItem({Key? key}) : super(key: key);

  @override
  State<ListViewCartItem> createState() => _ListViewCartItemState();
}

class _ListViewCartItemState extends State<ListViewCartItem> {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Notes order store',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                height: 0.07,
              ),
            ),
          ),
          content:TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Write Note.........",
              filled: true,
              fillColor: Color(0xFFFFF5F5),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyScale, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0)
                ),
                hintStyle:  TextStyle(color: AppColors.greyScale,fontSize: 14),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyScale, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0)
                )
            ),
          ),
          actions: [
           AppButton(text: "Note", onTap: (){})
          ],
        );
      },
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartCubit.get(context).getAllCartItem();

}
  @override
  Widget build(BuildContext context1) {
    return BlocConsumer<CartCubit,CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return (state is GetAllCartItemLoading)?CustomCardShimmer(
          number: 2,
          scrollDirection: Axis.vertical,
          height: 200.h,
        ):
        (CartCubit.get(context).cartModel!=null)?(CartCubit.get(context).cartModel!.data!.isEmpty)?const CartScreen():

        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Order Details",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlue,
              ),
            ),
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   icon: Icon(Icons.arrow_back_ios_new, color: AppColors.pink),
            // ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      _showAlertDialog(context1);
                    },
                    child: Icon(Icons.note,
                        size: 20, color: AppColors.pink),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: CartCubit.get(context).cartModel!.data!.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 56,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(CartCubit.get(context).cartModel!.data![index].branchProduct!.product!.mainImage!),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                  
                                SizedBox(width: 16.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          CartCubit.get(context).cartModel!.data![index].branchProduct!.product!.name!,
                                          style: TextStyle(
                                            color: AppColors.darkBlue,
                                            fontSize: 14,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                  
                                      ],
                                    ),
                                    SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //   '2x6.80',
                                        //   style: TextStyle(
                                        //     color: AppColors.greyScale,
                                        //     fontSize: 13,
                                        //     fontFamily: 'Work Sans',
                                        //     fontWeight: FontWeight.w400,
                                        //   ),
                                        // ),
                                        SizedBox(width: 15.w),
                                        Text(
                                          "${CartCubit.get(context).cartModel!.data![index].branchProduct!.branch!.name!} : ",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: AppColors.pink,
                                            fontSize: 13,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // SizedBox(width: 80.w),
                                        Text(
                                          ' \$ ${CartCubit.get(context).cartModel!.data![index].price}',
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            color: Colors.green,
                                            fontSize: 13,
                                            fontFamily: 'Work Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                  
                  
                  
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(color: AppColors.midGrey),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: ()
            {
                      // context.push((AppRouter.checkoutScreen));

            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadiusDirectional.circular(14)

              ),
              width: double.infinity,
              height: 50.h,
              child: Center(
                child: Text('Pay: ${CartCubit.get(context).total2.toString()} EGP',style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                ),),
              ),
            ),
          ),

        ):(state  is GetAllCartItemError)?Center(child: Text(state.message)):const SizedBox();
      },

    );
  }
}