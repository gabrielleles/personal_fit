import 'package:flutter/material.dart';
import '../../../../domain/entities/personal.dart';
import '../../shared/personal_avatar.dart';

class SimulationPersonalSummary extends StatelessWidget {
  final Personal personal;

  const SimulationPersonalSummary({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalAvatar(photoUrl: personal.photoUrl, radius: 40),
        const SizedBox(height: 12),
        Text(personal.name, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        Text(personal.specialties.join(', ')),
        const SizedBox(height: 6),
        Text('R\$ ${personal.price.toStringAsFixed(2)} por sessão'),
      ],
    );
  }
}
