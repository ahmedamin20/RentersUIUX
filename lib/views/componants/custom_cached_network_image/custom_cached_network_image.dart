import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget
{
  final String url;
  final double width;

  const CustomCachedNetworkImage({Key? key, required this.url,  this.width=double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      CachedNetworkImage(

      imageUrl: url,
      width: width!,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
