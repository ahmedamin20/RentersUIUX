import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/pages/edit_profile/widget/edit_profile_form.dart';

class EditProfile extends StatelessWidget {
  const  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Center(
               child: CircleAvatar(
                radius: 55.r,
                backgroundImage: const CachedNetworkImageProvider('https://th.bing.com/th/id/R.ffc2adcb86ed3f7689bb24df653691d3?rik=0l94POqHttqLew&pid=ImgRaw&r=0'),
                           ),
             ),
            SizedBox(height: 16.h,),
            Text(TextManager.changePhoto,style: TextStyleManager.textStyle14w500.copyWith(color: Color(0xff5DB329)),),
            SizedBox(height: 24.h,),
            const EditProfileForm(),
            SizedBox(height: 43.h,),
            CustomElevatedButton(text: TextManager.saveDetails, onPressed: (){}),
            SizedBox(height: 16.h,),
          ],
        ),
      ),
    );
  }
}
