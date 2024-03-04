import 'package:flutter/material.dart';
import 'package:ksb/core/resource/text_manager.dart';
class AllRestaurantScreen  extends StatelessWidget {
  const AllRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextManager.allRestaurant),
      ),
      body:   const Center(
        child: Text(TextManager.allRestaurant),
      ),
    );
  }
}
