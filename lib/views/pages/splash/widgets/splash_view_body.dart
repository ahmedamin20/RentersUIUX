import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import '../../../../core/caching_data/cacshing_date.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../data/model/login_model/login_model/login_model.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value)

   {
     LoginModel ?loginModel  = CachingData.instance.getCachedLogin() ;


     print(loginModel?.data?.token);
     if( loginModel!= null)
     {
       context.go(AppRouter.homeLayOut);
     }else
     {
       context.go(AppRouter.onBoardingDetails);

     }

   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
              width: 35.69,
              height: 27.72,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 35.72.w,
                      height: 27.72.h,
                      decoration: const ShapeDecoration(
                        color:ColorsManager.lightGreen,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              Text(
              TextManager.logoA2Z,
              style: TextStyleManager.textStyle40w600
            )
          ],
        ),
      ),
    );
  }
}
