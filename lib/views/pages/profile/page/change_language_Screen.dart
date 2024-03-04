
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ksb/views/pages/profile/widget/language_widget.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(

    body: SingleChildScrollView(
        child: LanguageWidget(),
      ),
    );
  }
}
