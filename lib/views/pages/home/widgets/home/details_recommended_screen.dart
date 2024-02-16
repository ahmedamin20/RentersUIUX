import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/pages/home/widgets/home/all_recommended_list_view.dart';
import 'package:ksb/views/pages/home/widgets/home/recommended_details_item.dart';
import 'package:ksb/views/pages/home/widgets/home/top_list_recommende_details.dart';

import '../../../../../core/resource/text_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../core/services/app_router.dart';
import 'list_type_food.dart';

class DetailsRecommendedScreen extends StatelessWidget {
  final String idStor;
  const DetailsRecommendedScreen({super.key,required this.idStor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 15.h,),
          TopListRecommendedDetails(idStor: idStor,),
          SizedBox(height: 15.h,),
          const ListTypeFood(),
          SizedBox(height: 15.h,),
         const Expanded(child: AllRecommendedListView()),
        ],
      ),
    );
  }
}
