import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:ksb/core/resource/radius_manager.dart';
import 'package:ksb/core/resource/space_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: ColorsManager.shimmerBeginColor,
        highlightColor: ColorsManager.shimmerEndColor,
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 20.h, width: 101.w),
                Skeleton(height: 20.h, width: 55.w),
              ],
            ),
            SpaceManager.sizedBox24h(context),
            SizedBox(
              height: 85.h,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 98.33.w,
                      height: 104.h,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: ColorsManager.border,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Skeleton(height: 40.r, width: 40.r),
                            Skeleton(
                              width: 48.r,
                              height: 14.r,
                            ),
                          ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 16,
                    );
                  },
                  itemCount: 10),
            ),
            SpaceManager.sizedBox24h(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skeleton(height: 20.h, width: 101.w),
                Skeleton(height: 20.h, width: 55.w),
              ],
            ),
            SpaceManager.sizedBox24h(context),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.30,
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 228.w,
                      height: 270.h,
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: ColorsManager.border),
                        borderRadius: BorderRadius.circular(RadiusManager.r10),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Skeleton(
                                  width: 48.w,
                                  height: 14.h,
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.black,
                                  size: 30.r,
                                )
                              ],
                            ),
                            Skeleton(
                              width: 185.w,
                              height: 70.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Skeleton(height: 16.h, width: 101.w),
                                Skeleton(height: 16.h, width: 55.w),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Skeleton(height: 16.h, width: 101.w),
                                Skeleton(height: 16.h, width: 55.w),
                              ],
                            ),
                          ]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 16,
                    );
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  final double height, width;
  const Skeleton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(RadiusManager.r10)),
    );
  }
}
