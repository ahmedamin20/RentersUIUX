import 'package:flutter/material.dart';

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

class BubbleNormalImageUpdate extends StatelessWidget {
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

  const BubbleNormalImageUpdate({
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
  }) : super(key: key);

  /// image bubble builder method
  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: <Widget>[
          isSender
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
                onTap: onTap ??
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return _DetailScreen(
                          tag: id,
                          image: image,
                        );
                      }));
                    },
                child: Hero(
                  tag: id,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(bubbleRadius),
                        topRight: Radius.circular(bubbleRadius),
                        bottomLeft: Radius.circular(tail
                            ? isSender
                                ? bubbleRadius
                                : 0
                            : BUBBLE_RADIUS_IMAGE),
                        bottomRight: Radius.circular(tail
                            ? isSender
                                ? 0
                                : bubbleRadius
                            : BUBBLE_RADIUS_IMAGE),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(bubbleRadius),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                image,
                                caption.isEmpty
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(caption,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: isSender
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
                                      time,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isSender
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
class _DetailScreen extends StatefulWidget {
  final String tag;
  final Widget image;

  const _DetailScreen({Key? key, required this.tag, required this.image})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

/// created using the Hero Widget
class _DetailScreenState extends State<_DetailScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: widget.tag,
            child: widget.image,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
