import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({
    super.key,
    required this.height,
    required this.name,
  });

  final double height;
  final String name;
  
  String get _imageUrl => "http://kasimadalan.pe.hu/yemekler/resimler/$name";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        _imageUrl,
        height: height * 0.35,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.broken_image,
            size: height * 0.35,
            color: Colors.grey,
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: height * 0.35,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
