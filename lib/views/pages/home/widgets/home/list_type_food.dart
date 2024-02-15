import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import '../../../../../../core/resource/text_style_manager.dart';


class ListTypeFood extends StatefulWidget {
  const ListTypeFood({super.key});

  @override
  State<ListTypeFood> createState() => _ListTypeFoodState();

}

class _ListTypeFoodState extends State<ListTypeFood> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeCubit.get(context).showAllMenuSections(id: HomeCubit.get(context).showAllBranchModel!.data![0].storeId!);

  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      buildWhen: (previous, current) {
        if (current is BranchAllProductLoading || current is BranchAllProductSuccess || current is BranchAllProductError||
            current is ChangeBranchColor
        ) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {},
      builder: (context, state)
      {
        return (state is BranchAllProductLoading)?CustomCardShimmer(
          number: 2,
          width: 100.w,
          height: 32.h,
          scrollDirection: Axis.vertical,
          length: 1,
        ):
        (HomeCubit.get(context).showAllMenuSectionsModel!=null) ?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 32.h,
            child: ListView.separated(
                controller: HomeCubit.get(context).scrollController2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>InkWell(
                  onTap: (){

                    HomeCubit.get(context).changeBranchColor(index: index);
                    HomeCubit.get(context).showAllBranchProduct(
                        id: HomeCubit.get(context).branchId==null?HomeCubit.get(context).showAllBranchModel!.data![0].id!:
                        HomeCubit.get(context).branchId!,
                        page: 1,
                        menuSelectionId: HomeCubit.get(context).showAllMenuSectionsModel!.data![index].id
                    );
                    HomeCubit.get(context).scrollController2.animateTo(
                      index*150.0.w, // Assuming each item has a height of 50
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );

                  },
                  child: Container(
                    decoration: ShapeDecoration(
                        color: index==HomeCubit.get(context).currentIndex2?ColorsManager.primaryColor:Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: Color(0xFFEDF1F7)),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8,right: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32.w,
                            height: 32.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/icons/taco.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            HomeCubit.get(context).showAllMenuSectionsModel!.data![index].name!,
                            style: TextStyleManager.textStyle12w500.copyWith(
                              color: index==HomeCubit.get(context).currentIndex2?Colors.white:ColorsManager.colorText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context,index)=>SizedBox(width: 10.w,),
                itemCount: HomeCubit.get(context).showAllMenuSectionsModel!.data!.length),
          ),
        ):
        (state is BranchAllProductError)?
        Text(state.message):const SizedBox();
      },

    );
  }
}