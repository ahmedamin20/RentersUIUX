import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class SelectYear extends StatelessWidget {
  const SelectYear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.calendar_view_day),
        SpaceManager.sizedBox12w(context),
        Expanded(
          child: TextField(
            enabled: true,
            readOnly: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      title:  Text("Year".tr()),
                      content: SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.75,
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          child: YearPicker(
                            firstDate: DateTime(2002),
                            lastDate: DateTime(2029),
                            selectedDate: DateTime.now(),
                            onChanged: (DateTime value) {},
                          )),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(),
                          child:  Text('Cancel'.tr()),
                        ),
                        TextButton(
                          onPressed: () => context.pop(),
                          child:  Text('OK'.tr()),
                        ),
                      ],
                    );
                  }));
            },
            cursorColor: ColorsManager.blue,
            decoration: InputDecoration(
              hintText: TextManager.searsh,
              hintStyle: TextStyleManager.textStyle16w500.copyWith(
                color: ColorsManager.gray,
              ),
              filled: true,
              fillColor: ColorsManager.inputColor,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(RadiusManager.r16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(RadiusManager.r16),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(RadiusManager.r16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(RadiusManager.r16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(RadiusManager.r16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
