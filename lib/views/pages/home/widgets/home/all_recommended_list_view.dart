import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/view_model/cubit/home_cubit/home_cubit.dart';
import 'package:ksb/views/componants/custom_card_shimmer/custom_card_shimmer.dart';
import 'package:ksb/views/pages/home/widgets/home/recommended_details_item.dart';

class AllRecommendedListView extends StatefulWidget {
  const  AllRecommendedListView({super.key});

  @override
  State<AllRecommendedListView> createState() => _AllRecommendedListViewState();
}

class _AllRecommendedListViewState extends State<AllRecommendedListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeCubit.get(context).showAllBranchProduct(id: HomeCubit.get(context).showAllBranchModel!.data![0].id!, page: 1);
  }

  @override
  void dispose() {
    HomeCubit.get(context).scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit,HomeState>(
      buildWhen: (previous, current) {
        if (current is BranchLoading || current is BranchSuccess || current is BranchError) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context,state){
      },
      builder: (BuildContext context, HomeState state) {
        return state is BranchLoading?const CustomCardShimmer(
          number: 2,
        scrollDirection: Axis.vertical,
        ) :
        HomeCubit.get(context).showAllBranchProducts!=null?
        ListView.separated(
          controller: HomeCubit.get(context).scrollController,
            itemBuilder: (context,index)=> RecommendedDetailsItem(
              showAllBranchProductData: HomeCubit.get(context).showAllBranchProducts!.showAllBranchProductData![index],
            ),
            separatorBuilder:  (context,index)=>SizedBox(height: 10.h,),
            itemCount:  HomeCubit.get(context).showAllBranchProducts!.showAllBranchProductData!.length
        ):(state is BranchError)? Text(state.message):const SizedBox();
      },

    );
  }
}
