import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/services/app_router.dart';

import 'history_note_item.dart';

class ListViewHistoryNotes extends StatelessWidget {
  const ListViewHistoryNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return InkWell(
              onTap: (){
                context.push((AppRouter.noteDetails));
              },
              child: const HistoryNoteItem());
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 20.h,);
        },
        itemCount: 4);
  }
}
