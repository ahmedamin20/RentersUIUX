import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_text_body_widget.dart';
import 'package:ksb/views/pages/home/widgets/pick_interest/pick_interest_grid_view.dart';

class PickInterestViewBody extends StatelessWidget {
  const PickInterestViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           CustomTextBodyWidget(
              titleText: TextManager.interestViewTitle.tr(),
              bodyText: TextManager.interestViewBody.tr()),
          SpaceManager.sizedBox32h(context),
          const PickInterestGridView(),
          CustomElevatedButton(text: TextManager.finish, onPressed: () {})
        ],
      ),
    );
  }
}
