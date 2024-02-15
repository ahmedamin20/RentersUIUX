
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';
import 'package:ksb/views/pages/transaction_item.dart';

import '../../core/resource/text_manager.dart';

class MyWalletView extends StatelessWidget {
  const MyWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: TextManager.MY_WALLET),
        body: SingleChildScrollView(
      child: Column(
        children: [

          Container(
            height: 250.h,
            width: double.infinity,
            color: ColorsManager.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  TextManager.WALLET_AMOUNT,
                  style: TextStyleManager.textStyle14w400,
                ),
                const Text(
                  '200 L.E',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.sh,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              itemBuilder: (context, index) => const TransactionItem(),
              separatorBuilder: (context, index) => SizedBox(
                height: 14.h,
              ),
              itemCount: 5,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    ));
  }
}
