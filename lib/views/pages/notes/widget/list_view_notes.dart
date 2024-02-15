import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/views/pages/notes/widget/note_item.dart';

class ListViewNotes extends StatelessWidget {
  const ListViewNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return const NoteItem();
        },
        separatorBuilder: (context,index){
         return SizedBox(height: 20.h,);
        },
        itemCount: 4);
  }
}
