
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/custom_App_bar.dart';
import 'package:ksb/views/pages/profile/widget/language_widget.dart';

import '../../notification/widget/notification_app_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        appBar: CustomAppBar(title: TextManager.language,),

    body: SingleChildScrollView(
        child: LanguageWidget(),
      ),
    );
  }
}
