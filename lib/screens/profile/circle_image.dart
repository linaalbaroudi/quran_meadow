import 'package:flutter/material.dart';
import '../../models/user.dart';

class CircleImage extends StatelessWidget {
  // 1
  const CircleImage({
    super.key,
    this.imageUrl,
    this.imageRadius = 50,
  });

  // 2
  final double imageRadius;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    // 3
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      // 4
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: imageRadius - 5,
        backgroundImage: AssetImage(User.sample.imageUrl),
      ),
    );
  }
}
