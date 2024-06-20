

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/services/app_router.dart';

import '../../core/caching_data/cacshing_date.dart';
import '../componants/custom_logo/custom_logo.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), ()
    {
      if(CachingData.instance.getCachedLogin()!=null) 
      {
        context.go(AppRouter.homeLayOut);


      }else{
      context.go(AppRouter.loginView);


      }
    });
  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: const CustomLogoWidget(),
      )
    );
  }
}

