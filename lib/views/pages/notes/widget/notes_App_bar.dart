import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/text_manager.dart';
import '../../../../core/resource/text_style_manager.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), onPressed: () => context.pop()),
      title: Text(
          TextManager.notes,
          style: TextStyleManager.textStyle20w500
      ),
      actions: [
        InkWell(
          onTap: (){
            context.push((AppRouter.historyNote));
          },
          child: Padding(
            padding:  EdgeInsets.only(right: 6.w),
            child: Image.asset(AssetsManager.historyNoteIcon,width: 47.w,height: 47.h,),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 44.h);
}
