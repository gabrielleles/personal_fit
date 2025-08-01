import 'package:flutter/material.dart';

import '../../../../domain/entities/personal.dart';

class PersonalDetailInfo extends StatelessWidget {
  final Personal personal;

  const PersonalDetailInfo({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          personal.bio,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          'Especialidades: ${personal.specialties.join(', ')}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Localização: ${personal.city}, ${personal.state}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Preço médio por sessão: R\$ ${personal.price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
