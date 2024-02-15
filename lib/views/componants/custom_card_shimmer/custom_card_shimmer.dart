import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/resource/colors_manager.dart';

class CustomCardShimmer extends StatelessWidget {
  const CustomCardShimmer({super.key, this.number = 1 ,
     this.length=10 ,
  this.height = 100.0,
  this.width = 100.0,
    this.scrollDirection = Axis.vertical,
  });

  final int number;
  final int length;
  final double height;
  final double width ;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    switch (number) {
      case 1:
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16

          ),
          scrollDirection: scrollDirection,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Shimmer.fromColors(
                baseColor: ColorsManager.primaryColor,
                highlightColor: Colors.white,
                child: const Card(),
              ),
            );
          },
          itemCount: length,
        );
        break;
      case 2:
        return ListView.builder(
            shrinkWrap: true,
            itemCount: length,
            scrollDirection: scrollDirection,
            itemBuilder: (context, index) {
              return SizedBox(
                width: width,
                height: height,
                child: Shimmer.fromColors(
                  baseColor: ColorsManager.primaryColor,
                  highlightColor: Colors.white,
                  child: const Card(),
                ),
              );
            },

        );
        break;

      default:
        return const CircularProgressIndicator();
    }
  }
}
