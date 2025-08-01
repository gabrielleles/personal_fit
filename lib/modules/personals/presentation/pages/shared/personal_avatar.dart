import 'package:flutter/material.dart';

class PersonalAvatar extends StatelessWidget {
  final String photoUrl;
  final double radius;

  const PersonalAvatar({
    super.key,
    required this.photoUrl,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(photoUrl),
      backgroundColor: Colors.grey[200],
    );
  }
}
