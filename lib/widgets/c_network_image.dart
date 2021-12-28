import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CNetworkImage extends StatelessWidget {
  const CNetworkImage(
    this.path, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final String path;
  final double? height, width;

  Widget background(Widget child) {
    return ColoredBox(
      color: Colors.transparent,
      child: Center(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      height: height,
      width: width,
      fit: BoxFit.fill,
      alignment: Alignment.center,
      progressIndicatorBuilder: (context, string, downloadProgress) {
        return background(
          CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        );
      },
      errorWidget: (context, string, error) {
        return background(
          const Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
