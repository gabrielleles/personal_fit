import 'package:flutter/material.dart';

class SimulationPriceDisplay extends StatelessWidget {
  final double price;

  const SimulationPriceDisplay({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Valor estimado',
          style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        Text(
          'R\$ ${price.toStringAsFixed(2)} / mês',
          style: theme.textTheme.headlineMedium?.copyWith(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
