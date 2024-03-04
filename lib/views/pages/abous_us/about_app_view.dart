
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator/service_locator.dart';

import '../../../core/resource/colors_manager.dart';
import '../../../core/resource/text_manager.dart';
import '../../../core/resource/text_style_manager.dart';
import '../../../data/repository/about_us_repo/about_us_repo.dart';
import '../../../view_model/cubit/about_us_cubit/about_us_cubit.dart';
import 'widget/about_us_form_widget.dart';
import 'widget/show_video_dialog.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              AboutUsCubit(sl<AboutUsRepoImpl>())..getAboutUs(),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text('1.9.4', style: TextStyleManager.textStyle20w600,),
                Text(
                  TextManager.currentVersion,
                  style:TextStyleManager.textStyle14w400.copyWith(color: ColorsManager.gray2),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: BlocConsumer<AboutUsCubit, AboutUsState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      AboutUsCubit aboutUsCubit = AboutUsCubit.get(context);
                      return state is AboutUsLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : aboutUsCubit.aboutUsModel != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AboutUsFormWidget(
                                        aboutUsCubit: aboutUsCubit),
                                    ShowVideoDialog(aboutUsCubit: aboutUsCubit),
                                  ],
                                )
                              : const SizedBox();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
