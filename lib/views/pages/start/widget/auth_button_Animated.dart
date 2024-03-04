import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/services/app_router.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_outlind_social_button.dart';

class AuthButtonsAnimted extends StatefulWidget {
  const AuthButtonsAnimted({super.key});

  @override
  State<AuthButtonsAnimted> createState() => _AuthButtonsAnimtedState();
}

class _AuthButtonsAnimtedState extends State<AuthButtonsAnimted>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    _slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.decelerate));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slidingAnimation,
      child: Container(
        margin: EdgeInsets.only(right: 24.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomElevatedButton(
              text: TextManager.continueWithEmail.tr(),
              color: ColorsManager.white,
              textColor: ColorsManager.primaryColor,
              onPressed: () {
                context.push(AppRouter.loginView);
              },
            ),
            SpaceManager.sizedBox16h(context),
            // CutomOutlindSocialButton(
            //   text: TextManager.countinueWithGoogle,
            //   logo: AssetsManager.googleIcon,
            //   borderColor: ColorsManager.white,
            //   textColor: ColorsManager.white,
            //   onPressed: () {},
            // ),
            // SpaceManager.sizedBox16h(context),
            // CutomOutlindSocialButton(
            //   text: TextManager.countinueWithFacebook,
            //   logo: AssetsManager.faceBookIcon,
            //   logoColor: ColorsManager.white,
            //   borderColor: ColorsManager.white,
            //   textColor: ColorsManager.white,
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
