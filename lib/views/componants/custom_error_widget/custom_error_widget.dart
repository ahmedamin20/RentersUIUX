import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resource/assets_manager.dart';
class CustomErrorWidget extends StatelessWidget
{
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Lottie.asset(AssetsManager.error);
  }
}
