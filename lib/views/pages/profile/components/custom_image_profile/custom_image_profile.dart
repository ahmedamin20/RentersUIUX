import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/resource/colors_manager.dart';

class CustomImageProfileWidget extends StatelessWidget {
  const CustomImageProfileWidget(
      {super.key, required this.url, this.isProfile = false, this.onTap});
  final String url;
  final bool isProfile;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: ColorsManager.white,
          radius: 50.r,
          child: urlRegex.hasMatch(url) ? CircleAvatar(
            radius: 49.r,
            backgroundColor: ColorsManager.white,
            backgroundImage: CachedNetworkImageProvider(
              url,
            ) ,
          ) :
          CircleAvatar(
            radius: 49.r,
            backgroundColor: ColorsManager.white,
            backgroundImage:
            FileImage(
              File(url),
            )
          )
          ,
        ),
        (!isProfile)
            ? Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!();
                  },
                  child: Container(
                    width: 22.w,
                    height: 22.w,
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      color: ColorsManager.grayDark,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(1000.r),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.edit,
                        color: ColorsManager.white,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
