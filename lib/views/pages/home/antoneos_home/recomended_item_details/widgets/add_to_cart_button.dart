import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/pages/home/antoneos_home/recomended_item_details/widgets/custom_divider.dart';

import '../../../../../../core/resource/text_manager.dart';
import '../../../../../componants/custom_elevated_button.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        SizedBox(height: 29.h,),

      ],
    );
  }
}
