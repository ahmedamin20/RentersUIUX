import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/helpers/cach_helpers/cach_helpers.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/data/model/profile_ui_model/profile_ui_model.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/componants/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:ksb/views/componants/custom_snack_bar/custom_snack_bar.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/resource/space_manager.dart';
import '../../../../core/services/app_router.dart';
import '../../../../data/model/model_lanageuages/language_model.dart';
import '../../../../view_model/cubit/layout_cubit/layout_cubit.dart';
import '../../../componants/custom_easy_loading/custom_easy_loading.dart';
import '../components/custom_card_profile/custom_card_profile.dart';
import '../components/header_profile_widget/header_profile_widget.dart';
import '../widget/profile_app_bar.dart';
import '../widget/profile_items_listview.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: ProfileCubit.get(context)..getProfileData(),
  child: BlocConsumer
    <
        ProfileCubit,
        ProfileState
    >
      (
      listener: (context, state)
     async {
        if(state is LogoutErrorState)
          {
            EasyLoading.dismiss();
            customSnackBar(
                message: state.error,
                snackBarType: SnackBarType.error,
                context: context);
          }else if(state is LogoutLoadingState){
          customEasyLoading();
        }else if(state is LogoutSuccessState)
          {
            EasyLoading.dismiss();
            String email = CacheHelper.getDataString(key: "email")  ?? "";
            String password = CacheHelper.getDataString(key: "password") ?? "";
          await  CacheHelper.clearData();
            CacheHelper.put(key: "email", value: email);
            CacheHelper.put(key: "password", value: password);
            print(CacheHelper.getDataString(key: "email"));
            print(CacheHelper.getDataString(key: "password"));
            context.go(AppRouter.loginView);
          }
        // TODO: implement listener
      },
      builder: (context, state)
      {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Scaffold(
            body:
            (state is GetProfileDataLoadingState)?
            const Center(child: CircularProgressIndicator()):
            (cubit.userModel!=null)?
            Column(
              children: [
                BlocConsumer<LayoutCubit,LayoutState>(
                  listener: (context,state){},
                  builder: (context,state){
                    return HeaderProfileWidget(userModel: cubit.userModel! ,
                      image: cubit.userModel!.avatar,
                    );
                  },
                ),
                Expanded(
                  child: AnimationLimiter(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          )
                          , children:  [
                        //header profile
                        // body
                        SizedBox(
                          height: SpaceManager
                              .sizedBox39h(context)
                              .height,
                        ),
                        const ProfileItemListView(),
                      ]),
                    ),
                  ),
                ),
              ],
            ) :const Center(child: Text("Error")));



      },
    ),
);
  }
}
