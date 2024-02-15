import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/assets_manager.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';
import 'package:ksb/views/componants/a2z_custom_button.dart';
import 'package:ksb/views/componants/custom_elevated_button.dart';
import 'package:ksb/views/componants/custom_text_form_field.dart';
import 'package:ksb/views/pages/notes/widget/dialog_widget.dart';
import 'package:ksb/views/pages/notes/widget/list_view_notes.dart';
import 'package:ksb/views/pages/notes/widget/notes_App_bar.dart';
import 'package:ksb/views/pages/notes/widget/show_snackbar_widget.dart';
import 'package:ksb/views/pages/notes/widget/slider_widget.dart';
import 'package:ksb/views/pages/notification/widget/notification_app_bar.dart';

class NotesScreen extends StatelessWidget {

  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotesAppBar(),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return const Dialog(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              child: ShowDialogWidget(),
            );
          });
        },
        backgroundColor: ColorsManager.colorXPrimary,
        shape: const CircleBorder(),
        child: Image.asset(AssetsManager.add,color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height: 44.h,),
            const ListViewNotes(),
            const ShowSnackBarWidget(),

          ],
        ) ,
      ),
    );
  }
}
