import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/views/pages/contuct_us/widget/contuct_us_widget.dart';

import '../../../core/resource/text_manager.dart';
import '../../../core/services/service_locator/service_locator.dart';
import '../../../data/repository/contact_us_repo/conatct_us_repo.dart';
import '../../../view_model/cubit/contact_us_cubit/contact_us_cubit.dart';
import '../../../view_model/cubit/layout_cubit/layout_cubit.dart';


class ContactUs extends StatelessWidget {
  const ContactUs({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)  =>ContactUsCubit(sl<ContactUsRepoImpl>()),
      child: SafeArea(
        // create: (context) => ContactUsCubit(sl.get<ContactUsRepoImpl>()),
      child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child: Column(
                children: [

                  SizedBox(
                    height: ScreenUtil().setHeight(10.h),
                  ),

                  const Expanded(child: ContactUsWidget())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}