import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/car_list/widgets/custom_filter_app_bar.dart';
import 'package:ksb/views/pages/car_list/widgets/custom_filter_button.dart';
import 'package:ksb/views/pages/car_list/widgets/filter/filter_list_view_with_header.dart';
import 'package:ksb/views/pages/car_list/widgets/filter/select_year.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grayDark,
      appBar: const CustomFilterAppBar(),
      body: Column(children: [
        SpaceManager.sizedBox24h(context),
        SizedBox(
          height: 30.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CustomFilterButton(
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 10.r,
            ),
          ),
        ),
        SpaceManager.sizedBox16h(context),
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RadiusManager.r32),
                topRight: Radius.circular(RadiusManager.r32),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilterListViewWithHeader(
                    headerText: 'Brand car'.tr(),
                    buttonText: 'More Model'.tr(),
                    onPress: () {},
                  ),
                  const Spacer(),
                  FilterListViewWithHeader(
                    headerText: 'Model'.tr(),
                    buttonText: 'More Model'.tr(),
                    onPress: () {},
                  ),
                  const Spacer(),
                  Text(
                    "Model year".tr(),
                    style: TextStyleManager.textStyle16w700
                        .copyWith(color: ColorsManager.grayDark),
                  ),
                  SpaceManager.sizedBox12h(context),
                  const SelectYear(),
                  const Spacer(),
                  CustomElevatedButton(text: "Apply Filters".tr(), onPressed: () {})
                ]),
          ),
        ),
      ]),
    );
  }
}
