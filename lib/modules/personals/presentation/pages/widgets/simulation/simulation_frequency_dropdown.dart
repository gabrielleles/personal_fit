import 'package:flutter/material.dart';

class SimulationFrequencyDropdown extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const SimulationFrequencyDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Frequência por semana', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SizedBox(
          width: 250,
          child: DropdownButtonFormField<int>(
            value: selected,
            items: List.generate(
              7,
                  (i) => DropdownMenuItem(value: i + 1, child: Text('${i + 1}x / semana')),
            ),
            onChanged: (value) => onChanged(value!),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              fillColor: Colors.blue.shade50,
            ),
          ),
        ),
      ],
    );
  }
}
