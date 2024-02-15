
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

import '../../core/resource/assets_manager.dart';
import '../../core/resource/text_manager.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w,),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey[200] ,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding:  EdgeInsets.all(4.r),
              child: SvgPicture.asset(
                'assets/images/transaction.svg',
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            TextManager.transaction,
            style: TextStyleManager.textStyle16w500,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '10:03 AM',
                style: TextStyleManager.textStyle16w500,
              ),
              Text(
                '+ \$800,50',
                style: TextStyleManager.textStyle16w500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
