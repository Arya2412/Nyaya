import 'package:flutter/material.dart';

class ProfilePhotoWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  ProfilePhotoWidget({
    required this.imageUrl,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 2),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
