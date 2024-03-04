import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/repository/profile_repo/profile_repo.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/componants/custom_app_bar/custom_app_bar.dart';
import 'package:ksb/views/pages/profile/page/profile_screen.dart';

import '../../../../core/services/service_locator/service_locator.dart';

class TermsAndCondationScreen extends StatelessWidget {
  const TermsAndCondationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ProfileCubit(sl<ProfileRepoImpl>())
        ..getTermsAndCondation(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body:
            (state is GetTermsAndCondationLoading)?
            const Center(child: CircularProgressIndicator(),) :
              (state is GetTermsAndCondationSuccess)?
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h)
                    ,
                    child: Text(state.termsAndCondationModel.data!.content!,
                    style: TextStyleManager.textStyle16w500.copyWith(
                      color: LayoutCubit.get(context).isDark ? Colors.white : Colors.black,
                    ),
                    ),
                  ),
                )
                :const Text("some Thing Error") ,
          );
        },
      ),
    );
  }
}
