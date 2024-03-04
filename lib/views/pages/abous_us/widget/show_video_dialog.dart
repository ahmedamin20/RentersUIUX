import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksb/core/resource/colors_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../view_model/cubit/about_us_cubit/about_us_cubit.dart';


class ShowVideoDialog extends StatelessWidget {
 final AboutUsCubit aboutUsCubit;
  const ShowVideoDialog({super.key, required this.aboutUsCubit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // aboutUsCubit.openYouTubeLink();
        showDialog(context: context, builder: (context)=>AlertDialog(
          content: YoutubePlayer(
            controller: YoutubePlayerController(
              // initialVideoId:
              // 'https://www.youtube.com/watch?v=dSBRQUebo7g'
              //     .split('=')
              //     .last,
              initialVideoId: aboutUsCubit.aboutUsModel!.data!.youtubeVideoUrl!.split('=').last,
              flags: const YoutubePlayerFlags(
                useHybridComposition: true,
                showLiveFullscreenButton: false,
                autoPlay: true,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor:
            ColorsManager.primaryColor,
            onReady: (){
              // Disable full-screen button
              YoutubePlayerController controller = YoutubePlayerController(
                initialVideoId:
                aboutUsCubit.aboutUsModel!.data!.youtubeVideoUrl!.split('=').last
                    .split('=')
                    .last,
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              );
              controller.addListener(() {
                if (controller.value.isFullScreen) {
                  // Disable full-screen
                  controller.toggleFullScreenMode();
                }
              });
            },
          ),
        ));
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 140.w,
          height: 80.h,
          decoration: BoxDecoration(
            image:  const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  AssetsManager.youtube),
            ),
            borderRadius:
            BorderRadius.circular(30.sp),
          ),
        ),
      ),
    );
  }
}
