import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';

import '../../../../core/resource/text_style_manager.dart';


class SliderWidget extends StatefulWidget {
  RangeValues values=const RangeValues(300, 700);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Text('\$${widget.values.start.toString()}' ,style: TextStyleManager.textStyle18w600,),
            const Spacer(),
            Text('\$${widget.values.end}',style: TextStyleManager.textStyle18w600,),
          ],
        ),
        SizedBox(height: 14.h,),
        RangeSlider(

            values: widget.values,
            activeColor: ColorsManager.colorPurple,
            inactiveColor: ColorsManager.colorSlider,
            onChanged:(value) {
              setState(() {
                widget.values = value;
              });
            },
            min: 0.0,
            max: 1000.0,
            divisions: 20,
            labels: RangeLabels(widget.values.start.round().toString(), widget.values.end.round().toString())
        ),
      ],
    );

  }
}
