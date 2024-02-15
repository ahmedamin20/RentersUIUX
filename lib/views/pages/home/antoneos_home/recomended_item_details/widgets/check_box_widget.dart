import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resource/colors_manager.dart';

class CustomCheckBox extends StatefulWidget {


  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
   bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return   Checkbox(
      checkColor: ColorsManager.white,
      activeColor: ColorsManager.blue,
      focusColor: ColorsManager.blackColor,
      hoverColor: ColorsManager.graySimiDark,

      fillColor:  MaterialStatePropertyAll(isChecked?ColorsManager.colorBlue:ColorsManager.checkBoxColor),
      side: const BorderSide(color:ColorsManager.checkBoxColor,width: 3 ),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          print(value);
          isChecked= value!;
        });
      },
    );
  }
}
