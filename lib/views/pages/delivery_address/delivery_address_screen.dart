import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/pages/delivery_address/widget/delivery_iaddress_list_view.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';
import 'package:ksb/views/pages/payment/widget/custom_bottom_sheet.dart';

class DeliveryAddressScreen extends StatelessWidget {
  const DeliveryAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: TextManager.deliveryAddress),
      body: const DeliveryItemListView(),
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child:  A2zCustomButton(buttonName: TextManager.addNewAddress, onPressed: (){},),
      )
    );
  }
}
