import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/data/model/language_model/language_model.dart';
import 'package:ksb/view_model/cubit/profile_cubit/profile_cubit.dart';
import 'package:ksb/views/pages/profile/widget/language_item.dart';

import '../../../../data/model/model_lanageuages/language_model.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<LanguageModel> languageItemList=[

      LanguageModel(text: TextManager.english, flag: AssetsManager.american,value: 'English',),
      LanguageModel(text: TextManager.arabic, flag: AssetsManager.egy,value: 'Arabic', ),

    ];

    return Padding(
      padding:  EdgeInsets.only(top: 32+8.h),
      child: ListView.builder(
        itemCount: languageItemList.length,
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
          return  InkWell(
            onTap: (){
              ProfileCubit.get(context).changeLanguage(index);
            },
            child: LanguageItem(
                  text: languageItemList[index]!.text,
                  flag: languageItemList[index]!.flag, index: index,
      
              ),
          );
          }),
    );
  }
}
