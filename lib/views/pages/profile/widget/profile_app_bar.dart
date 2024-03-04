import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378.5.w,
      height: 272.5.h,
      color: ColorsManager.colorPink,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width:  MediaQuery.sizeOf(context).width * 0.080,
    ),
              const Spacer(),
              Text(TextManager.profile,style: TextStyleManager.textStyle20w500,),
              const Spacer(),
              InkWell(
                  onTap: (){
                    context.push((AppRouter.editProfile));
                  },
                  child: SvgPicture.asset(AssetsManager.edit)),
              SizedBox(width: 10.w,)
            ],
          ),
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider('https://th.bing.com/th/id/OIP.Y7f5zByKyMrJXO8pSEfBSgHaHa?rs=1&pid=ImgDetMain'),
              radius: 58,
            ),
          ),
          SizedBox(height: 12.h,),
          Text('Ulvin Omarov',style: TextStyleManager.textStyle20w500 ,)
        ],
      ),

    );
  }
}
