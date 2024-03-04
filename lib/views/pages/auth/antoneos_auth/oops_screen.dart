import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/custom_Auth_App_bar.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/widget/congrats_widget.dart';
import 'package:ksb/views/pages/auth/antoneos_auth/widget/oops_widget.dart';

class OopsScreen extends StatelessWidget {
  const OopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: OopsWidget(),
      ),
    );
  }
}
