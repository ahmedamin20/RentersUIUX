import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/pages/onbording/widget_a2z/show_botton_sheet_lang.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/colors_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';
import '../../../../core/services/app_router.dart';
import 'buildBoardingItem.dart';

class OnBoardingBody extends StatelessWidget {
  PageController boardController;
  GlobalKey<ScaffoldState> keyScaffold;
   OnBoardingBody({super.key , required this.boardController,required this.keyScaffold});


  @override
  Widget build(BuildContext context)
  {
    return  Column(
      children: [
        Expanded(
          child: PageView.builder(
              controller: boardController,
              itemCount: 4,
              itemBuilder: (context, index) => const buildBoardingItem()),
        ),
        SmoothPageIndicator(
          count: 3,
          effect: const ExpandingDotsEffect(
              radius: 10,
              dotHeight: 8,
              expansionFactor: 3,
              activeDotColor: Color(0xff5DB329),
              dotWidth: 8,
              spacing: 5.0,
              dotColor: Color(0xffB2E87C)),
          controller: boardController,
        ),
        const SizedBox(
          height: 16,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(context: context, builder:(context) {
              return const ShowBottomSheetLangauge();
            },);
            // context.
            //     .showBottomSheet((context) => const ShowBottomSheetLangauge());
          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage( AssetsManager.american),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                  TextManager.english,
                  style: TextStyleManager.textStyle14w400
              ),
              SizedBox(width: 10.w),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
          onPressed: ()
          {
            context.push(AppRouter.onBoardingHello);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryColor, fixedSize: Size(343.w, 48.h)),
          child: Text(
            TextManager.next,
            textAlign: TextAlign.center,
            style: TextStyleManager.textStyle16w700.copyWith(color: Colors.white),
          ),
        ),
         SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
