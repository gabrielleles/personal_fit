import 'package:flutter/material.dart';

import '../../../../domain/entities/personal.dart';
import '../../shared/personal_avatar.dart';


class SimulationAvatarAndName extends StatelessWidget {
  final Personal personal;

  const SimulationAvatarAndName({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        PersonalAvatar(photoUrl: personal.photoUrl, radius: 48),
        const SizedBox(height: 16),
        Text(
          'Personal',
          style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          personal.name,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
