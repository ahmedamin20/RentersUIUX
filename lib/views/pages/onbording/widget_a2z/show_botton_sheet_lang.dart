import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';

class ShowBottomSheetLangauge extends StatelessWidget {
  const ShowBottomSheetLangauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const ShapeDecoration(

          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        width: double.infinity,
        height: 350.h,
        child: Column(
          children: [
             SizedBox(
              height: 24.h,
            ),
            Text(
              TextManager.appLanguage,
              textAlign: TextAlign.center,
              style: TextStyleManager.textStyle20w600,
            ),
            SizedBox(
              height: 32.h,
            ),
            ListTile(
              leading:  CircleAvatar(
                radius: 15.r,
                backgroundImage:
                const AssetImage( AssetsManager.american),
              ),
              title: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      TextManager.english,
                      style:TextStyleManager.textStyle16w700,
                    ),
                  ),
                  Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {})
                ],
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                radius: 15,
                backgroundImage:
                AssetImage( AssetsManager.egy),
              ),
              title: Row(
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      TextManager.arabic,
                      style:  TextStyleManager.textStyle16w700,
                    ),
                  ),
                  Radio(
                      value: 0,
                      groupValue: 0,
                      onChanged: (value) {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
