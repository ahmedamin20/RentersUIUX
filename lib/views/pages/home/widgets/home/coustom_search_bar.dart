import 'package:flutter/material.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/text_manager.dart';
import 'package:ksb/core/resource/text_style_manager.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorsManager.blue,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: ColorsManager.grayDark,
          ),
          onPressed: () {},
        ),
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
    );
  }
}
