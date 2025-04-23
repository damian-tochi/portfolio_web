import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

Future<void> _fakeLoad() async {
  await Future.delayed(const Duration(milliseconds: 300));
}

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;


  const CachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorWidget('No image available');
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? width ?? 10),
      child: FutureBuilder(
        future: _fakeLoad(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: Container(
              width: width ?? double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                image: DecorationImage(
                  image: MemoryImage(kTransparentImage),
                  fit: fit ?? BoxFit.cover,
                ),
              ),
            ));
          } else {
            return Image.asset(imageUrl);
          }
        },
      ),
    );
  }
}

Widget _buildErrorWidget(String message) {
  return Container(
    color: Colors.orange.shade200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.broken_image_outlined,
          color: Colors.orange.shade200,
        ),
      ],
    ),
  );
}
