import 'package:flutter/material.dart';

class ImageUtil extends StatelessWidget {
  static const String logTag = 'NetImageUtils';
  final String src;
  final BoxFit fitSize;
  final Color progressColor;
  final double height;
  final double width;

  const ImageUtil(
      {Key? key,
      required this.src,
      required this.fitSize,
      required this.progressColor,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height == 0 ? null : height,
      width: width == 0 ? null : width,
      fit: fitSize,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
            color: progressColor,
          ),
        );
      },
      errorBuilder: (context, error, stacktrace) {
        return Image.network(
          src,
          height: height == 0 ? null : height,
          width: width == 0 ? null : width,
          fit: fitSize,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: progressColor,
              ),
            );
          },
          errorBuilder: (context, error, stacktrace) {
            return height >= 50 || height == 0
                ? Image.asset(
                    'assets/img/oru_phone.png',
                    fit: BoxFit.contain,
                    height: 127,
                    width: 141,
                  )
                : Icon(
                    Icons.image_not_supported_outlined,
                    size: 24,
                    color: Colors.black,
                  );
            // return const Icon(Icons.image_not_supported_outlined);
          },
        );
      },
    );
  }
}
