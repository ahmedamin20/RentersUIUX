import 'package:flutter/cupertino.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/resource/colors_manager.dart';


void customSnackBar(
    {required String message,
    required SnackBarType snackBarType,
    required BuildContext context}) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomTopSnackBar(
      snackBarType: snackBarType,
      message: message,
    ),
  );
}

enum SnackBarType { error, success, info }

class CustomTopSnackBar extends StatelessWidget {
  final String? message;
  final SnackBarType? snackBarType;

  const CustomTopSnackBar({
    super.key,
    required this.message,
    required this.snackBarType,
  });

  @override
  Widget build(BuildContext context) {
    switch (snackBarType) {
      case SnackBarType.error:
        return CustomSnackBar.error(
          maxLines: 10,
          backgroundColor: ColorsManager.redColor,
          message: message!,
        );
      case SnackBarType.success:
        return CustomSnackBar.success(
          maxLines: 10,
          backgroundColor: ColorsManager.green,
          message: message!,
        );
      case SnackBarType.info:
        return CustomSnackBar.info(
          backgroundColor: ColorsManager.gold,
          message: message!,
        );
      default:
        return CustomSnackBar.success(
          maxLines: 10,
          backgroundColor: ColorsManager.primaryColor,
          message: message!,
        );
    }
  }
}