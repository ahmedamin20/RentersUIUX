import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/pages/home/widgets/favorites/widgets/favorites_list_item.dart';
import 'package:ksb/views/pages/home/widgets/home/coustom_search_bar.dart';

import '../../../../core/services/app_router.dart';
import '../widgets/custom_card_my_cars_widget.dart';

class MyCarsView extends StatelessWidget {
  const MyCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment'.tr(),
            textAlign: TextAlign.center,
            style: TextStyleManager.textStyle18w700
                .copyWith(color: ColorsManager.grayDark)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: SingleChildScrollView(
          child: Column(children: [
            const CustomSearchBar(),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemBuilder: (context, index) {
                return CustomCardMyCar(
                  function: () {
                    context.push(AppRouter.cardetails);
                  },
                );
              },
              itemCount: 5,
            )
          ]),
        ),
      ),
    );
  }
}
