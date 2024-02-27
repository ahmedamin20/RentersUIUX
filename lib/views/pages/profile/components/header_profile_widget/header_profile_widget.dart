import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/data/model/user_model/user_model.dart';
import 'package:ksb/view_model/cubit/layout_cubit/layout_cubit.dart';

import '../../../../../core/resource/assets_manager.dart';
import '../../../../../core/resource/space_manager.dart';
import '../../../../../core/resource/text_style_manager.dart';
import '../../../../../core/services/app_router.dart';
import '../../../../componants/custom_cached_network_image/custom_cached_network_image.dart';
import '../custom_image_profile/custom_image_profile.dart';

class HeaderProfileWidget extends StatelessWidget {
  const HeaderProfileWidget(
      {Key? key,
      this.isProfile = true,
      this.onTap,
      this.titlePage,
      required this.userModel,
      required this.image})
      : super(key: key);
  final bool isProfile;
  final UserModel userModel;
  final Function? onTap;
  final String? image;
  final String? titlePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: LayoutCubit.get(context).isDark
            ? ColorsManager.blackColor
            : ColorsManager.colorPink,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 24.h, bottom: 10.h, left: 24.w, right: 24.w),
              child: Row(
                children: [
                  (isProfile)
                      ? const SizedBox.shrink()
                      : GestureDetector(
                          onTap: () => context.pop(),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: ColorsManager.colorText,
                          ),
                        ),
                  //  isProfile?
                  // // InkWell(
                  // //   onTap: (){
                  // //     LayoutCubit.get(context).changeDarkMood();
                  // //   },
                  // //   child: Column(
                  // //     children: [
                  // //       LayoutCubit.get(context).isDark==false?  const CircleAvatar(
                  // //          backgroundColor: ColorsManager.grayDark,
                  // //          radius: 15,
                  // //          child:  Icon(Icons.dark_mode,color: ColorsManager.white,),
                  // //        ): const CircleAvatar(
                  // //          backgroundColor: ColorsManager.white,
                  // //          radius: 15,
                  // //          child:  Icon(Icons.light_mode,color: ColorsManager.primaryColor,)),
                  // //     ],
                  // //   ),
                  // // )
                  //  :const SizedBox.shrink(),
                  const Spacer(),
                  Text(
                    titlePage ?? TextManager.profile.tr(),
                    style: TextStyleManager.textStyle18w700
                        .copyWith(color: ColorsManager.white),
                  ),
                  const Spacer(),
                  isProfile
                      ? GestureDetector(
                          onTap: () =>
                              context.push(AppRouter.profileSettingScreen),
                          child: SvgPicture.asset(
                            AssetsManager.settingsIcon,
                            color: ColorsManager.colorText,
                          ))
                      : const SizedBox.shrink(),
                ],
              ),
            ),

            // profile image
            CustomImageProfileWidget(
              onTap: () {
                if (onTap != null) onTap!();
              },
              isProfile: titlePage != null ? true : isProfile,
              url: image!,
            ),
            SizedBox(
              height: SpaceManager.sizedBox16h(context).height,
            ),
            // name
            Text(
              userModel.name!,
              style: TextStyleManager.textStyle18w700
                  .copyWith(color: ColorsManager.colorText),
            ),
            SizedBox(
              height: SpaceManager.sizedBox16h(context).height,
            ),
            // account type
            Text(
              userModel.type!.tr(),
              style: TextStyleManager.textStyle12w500
                  .copyWith(color: ColorsManager.colorText),
            ),
            SizedBox(
              height: SpaceManager.sizedBox16h(context).height,
            ),
          ],
        ),
      ),
    );
  }
}
