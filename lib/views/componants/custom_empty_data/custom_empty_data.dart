import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resource/assets_manager.dart';
class CustomEmptyData extends StatelessWidget
{
  const CustomEmptyData({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Lottie.asset(AssetsManager.emptyData);
  }
}
