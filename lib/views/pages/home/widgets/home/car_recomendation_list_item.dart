import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CarRecomendationListItem extends StatelessWidget {
  const CarRecomendationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
          color: ColorsManager.inputColor,
          borderRadius: BorderRadius.circular(RadiusManager.r16)),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
              ],
            ),
            Image.asset(
              AssetsManager.carImage,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "neme part",
              textAlign: TextAlign.center,
              style: TextStyleManager.textStyle12w500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "112.150.00",
                  style: TextStyleManager.textStyle12w500
                      .copyWith(color: ColorsManager.blue),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
