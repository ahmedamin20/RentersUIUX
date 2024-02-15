import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';

class CustomIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;
  final double padding;
  const CustomIconButton(
      {super.key,
      required this.iconData,
      required this.onTap,
      this.padding = 10.0});

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r10),
            border: Border.all(color: ColorsManager.border, width: 1.0),
          ),
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Icon(
                iconData,
                color: ColorsManager.grayDark,
              ),
            ),
          ),
        ));
  }
}
