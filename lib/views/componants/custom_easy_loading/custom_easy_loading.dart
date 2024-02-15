
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ksb/core/resource/colors_manager.dart';

 customEasyLoading ({String text = "loading..."})
{

    EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.dualRing
  ..loadingStyle = EasyLoadingStyle.custom
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = ColorsManager.blue
  ..indicatorColor = ColorsManager.border
  ..textColor = ColorsManager.white
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = false
  ..dismissOnTap = false
  ..customAnimation = CustomAnimation();
  EasyLoading.show(status: text);

}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}