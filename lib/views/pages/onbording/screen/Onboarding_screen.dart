import 'package:flutter/material.dart';
import 'package:ksb/views/pages/onbording/widget_a2z/onBoarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  var boardController = PageController();
  var keyScaffold = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: keyScaffold,
        body: OnBoardingBody(boardController: boardController, keyScaffold: keyScaffold,));
  }
}

