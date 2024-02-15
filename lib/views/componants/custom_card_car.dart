import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resource/text_style_manager.dart';
import '../../data/model/car_grage_model/car_grage_model.dart';
class CustomCarCard extends StatelessWidget {
  const CustomCarCard({
    super.key,
    required this.baseGrageModel,
    required this.onTap
  });

  final BaseGrageModel baseGrageModel;
  final Function ?onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            title: Text(
              baseGrageModel.name!,
              style: TextStyleManager.textStyle16w500,
            ),
            subtitle: Text(
              baseGrageModel.brand!
                  .name!,
              style: TextStyleManager.textStyle12w500,
            ),
            trailing: GestureDetector(
              onTap: () {
                onTap!();

              },
              child: baseGrageModel
                  .favorite! ?
              const Icon(
                Icons.favorite, color: Colors.red,
              ) : const Icon(
                Icons.favorite_border, color: Colors.grey,
              ),
            )
        ),
      ),
    );
  }
}
