import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/views/pages/notes/widget/list_view_history_notes.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';

class HistoryNotesScreen extends StatelessWidget {
  const HistoryNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: TextManager.historyNotesOrder),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 17.h,),
            const ListViewHistoryNotes(),

          ],
        ),
      ),
    );
  }
}
