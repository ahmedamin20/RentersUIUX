import 'dart:io' as io;

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

/// Stateful widget to fetch and then display video content.

class ShowVideo extends StatefulWidget {
  const ShowVideo({
    super.key,
    required this.videoUrl,
  });

  final VideoPlayerController videoUrl;

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          widget.videoUrl.pause();
          Navigator.pop(context);
          return false;
        },
        child: Center(
          child: CustomVideoPlayer(
              customVideoPlayerController: CustomVideoPlayerController(
            videoPlayerController: widget.videoUrl,
            context: context,
          )),
        ),
      ),
    );
  }
}

const double BUBBLE_RADIUS_IMAGE = 16;

///basic image bubble type
///
///
/// image bubble should have [id] to work with Hero animations
/// [id] must be a unique value
///chat bubble [BorderRadius] can be customized using [bubbleRadius]
///chat bubble color can be customized using [color]
///chat bubble tail can be customized  using [tail]
///chat bubble display image can be changed using [image]
///[image] is a required parameter
///[id] must be an unique value for each other
///[id] is also a required parameter
///message sender can be changed using [isSender]
///[sent],[delivered] and [seen] can be used to display the message state

class VideoApp extends StatefulWidget
{
  static const loadingWidget = Center(
    child: CircularProgressIndicator(),
  );

  final String id;
  final Widget image;
  final double bubbleRadius;
  final bool isSender;
  final Color color;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final String caption;

  final String time;

  final void Function()? onTap;
  final String videoUrl;

  const VideoApp({
    Key? key,
    required this.id,
    required this.image,
    this.bubbleRadius = BUBBLE_RADIUS_IMAGE,
    this.isSender = true,
    this.color = Colors.white70,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.onTap,
    this.time = "",
    this.caption = "",
    this.videoUrl = "",
  }) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    if (widget.videoUrl.contains('http')) {
      controller = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          setState(() {});
        });
    } else {
      controller = VideoPlayerController.file(io.File(widget.videoUrl))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  late final fileName;

  // Future<void> x() async {
  //   fileName = await VideoThumbnail.thumbnailFile(
  //     video: widget.videoUrl,
  //     thumbnailPath: (await getTemporaryDirectory()).path,
  //     imageFormat: ImageFormat.WEBP,
  //     maxHeight: 64,
  //     // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
  //     quality: 75,
  //   );
  //   print("/////////////////////////////");
  //   print(fileName);
  //   print("/////////////////////////////");
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  /// image bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (widget.sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (widget.delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (widget.seen) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          widget.isSender
              ? const Expanded(
                  child: SizedBox(
                    width: 5,
                  ),
                )
              : Container(),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .6,
            ),
            child: GestureDetector(
                onTap: widget.onTap ??
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ShowVideo(
                          videoUrl: controller,
                        );
                      }));
                    },
                child: Hero(
                  tag: widget.id,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(widget.bubbleRadius),
                        topRight: Radius.circular(widget.bubbleRadius),
                        bottomLeft: Radius.circular(widget.tail
                            ? widget.isSender
                                ? widget.bubbleRadius
                                : 0
                            : BUBBLE_RADIUS_IMAGE),
                        bottomRight: Radius.circular(widget.tail
                            ? widget.isSender
                                ? 0
                                : widget.bubbleRadius
                            : BUBBLE_RADIUS_IMAGE),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(widget.bubbleRadius),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image(image: FileImage(fileName)),
                                controller.value.isInitialized
                                    ? AspectRatio(
                                        aspectRatio: controller.value.aspectRatio,
                                        child: VideoPlayer(controller),
                                      )
                                    : const Center(
                                        child:
                                            CircularProgressIndicator.adaptive()),
                                widget.caption.isEmpty
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(widget.caption,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: widget.isSender
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        stateIcon != null && stateTick
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.time,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: widget.isSender
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    stateIcon,
                                  ],
                                ),
                              )
                            : const SizedBox(
                                width: 1,
                              ),
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

/// detail screen of the image, display when tap on the image bubble
