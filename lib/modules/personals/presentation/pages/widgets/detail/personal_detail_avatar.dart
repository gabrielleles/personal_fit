import 'package:flutter/material.dart';

import '../../shared/personal_avatar.dart';

class PersonalDetailAvatar extends StatelessWidget {
  final String photoUrl;
  final String name;
  final double rating;

  const PersonalDetailAvatar({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        PersonalAvatar(photoUrl: photoUrl, radius: 60),
        const SizedBox(height: 12),
        Text(
          name,
          style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            const SizedBox(width: 6),
            Text(rating.toStringAsFixed(1)),
          ],
        ),
      ],
    );
  }
}
