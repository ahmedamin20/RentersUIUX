import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

import '../../../../../core/services/app_router.dart';

class TermsAndPolicy extends StatelessWidget {
  const TermsAndPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: TextManager.bySigningUp.tr(),
            style: TextStyleManager.textStyle16w700.copyWith(
              color: ColorsManager.gray,
            ),
          ),
          TextSpan(
            text: TextManager.termsOfService.tr(),
            recognizer: TapGestureRecognizer()..onTap = ()
            {
              context.push(AppRouter.termsAndCondationView);
            },
            style: TextStyleManager.textStyle16w700.copyWith(
              color: ColorsManager.blue,
            ),
          ),
          TextSpan(
            text: TextManager.and.tr(),
            style: TextStyleManager.textStyle16w700.copyWith(
              color: ColorsManager.gray,
            ),
          ),
          TextSpan(
            text: TextManager.privacyPolicy.tr(),
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: TextStyleManager.textStyle16w700.copyWith(
              color: ColorsManager.blue,
            ),
          ),
        ],
      ),
    );
  }
}
