import 'package:flutter/material.dart';

class DogImageWidget extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const DogImageWidget({
    super.key,
    required this.imageUrl,
    this.height = 150,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: height,
          width: width,
          color: Colors.grey[300],
          child: const Icon(Icons.pets, size: 50),
        );
      },
    );
  }
}