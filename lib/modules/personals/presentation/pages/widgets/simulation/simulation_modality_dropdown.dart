import 'package:flutter/material.dart';

class SimulationModalityDropdown extends StatelessWidget {
  final String selected;
  final List<String> modalities;
  final ValueChanged<String> onChanged;

  const SimulationModalityDropdown({
    super.key,
    required this.selected,
    required this.modalities,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Escolha a modalidade', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SizedBox(
          width: 250,
          child: DropdownButtonFormField<String>(
            value: selected,
            items: modalities.map((mod) => DropdownMenuItem(value: mod, child: Text(mod))).toList(),
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
