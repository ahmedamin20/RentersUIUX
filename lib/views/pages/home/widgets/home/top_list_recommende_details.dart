import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/view_model/cubit/home_cubit/home_cubit.dart';
import '../../../../../../core/resource/text_style_manager.dart';
import '../../../../componants/custom_card_shimmer/custom_card_shimmer.dart';


class TopListRecommendedDetails extends StatefulWidget {
  final String idStor;
  const TopListRecommendedDetails({super.key,required this.idStor});

  @override
  State<TopListRecommendedDetails> createState() => _TopListRecommendedDetailsState();
}

class _TopListRecommendedDetailsState extends State<TopListRecommendedDetails> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    HomeCubit.get(context).getAllBranch(storeId:widget.idStor, page: 1);
  }
  // value: HomeCubit.get(context)..scroll( HomeCubit.get(context).getAllBranch(page: HomeCubit.get(context).page,storeId:widget.idStor)),

  @override
  Widget build(BuildContext context){
    return   BlocProvider.value(
      value: HomeCubit.get(context)..scroll(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return (state is HomeLoading)?
           CustomCardShimmer(
            number: 2,
            width: 100.w,
            height: 32.h,
            length: 1,
            scrollDirection: Axis.vertical,
          ):(HomeCubit.get(context).showAllBranchModel!=null)?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 32.h,
              child: ListView.separated(
                controller: HomeCubit.get(context).scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>
                      InkWell(
                        onTap: ()
                        {
                          HomeCubit.get(context).showAllMenuSections(id: HomeCubit.get(context).showAllBranchModel!.data![index].storeId!);
                          HomeCubit.get(context).showAllBranchProduct(id: HomeCubit.get(context).showAllBranchModel!.data![index].id!, page: 1);
                          HomeCubit.get(context).branchId=HomeCubit.get(context).showAllBranchModel!.data![index].id!;
                          HomeCubit.get(context).changeMenuSectionColor(index: index);
                          HomeCubit.get(context).scrollController.animateTo(
                          index*150.0.w, // Assuming each item has a height of 50
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        decoration: ShapeDecoration(
                            color: index==HomeCubit.get(context).currentIndex?ColorsManager.primaryColor:Colors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color: Color(0xFFEDF1F7)),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8,right: 16),
                          child:   Center(
                            child: Text(
                              HomeCubit.get(context).showAllBranchModel!.data![index].name!,
                              style: TextStyleManager.textStyle12w500.copyWith(
                                color: index==HomeCubit.get(context).currentIndex?ColorsManager.white:ColorsManager.colorText,
                              ),
                            ),
                          ),
                        ),
                      )),
                  separatorBuilder: (context,index)=>SizedBox(width: 10.w,),
                  itemCount: HomeCubit.get(context).showAllBranchModel!.data!.length),
            ),
          ):(state is HomeError)? Text(state.message):const SizedBox();
        },

      ),
    );
  }
}
