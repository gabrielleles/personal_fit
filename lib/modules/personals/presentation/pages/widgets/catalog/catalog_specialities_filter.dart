import 'package:flutter/material.dart';

class CatalogSpecialtyFilter extends StatelessWidget {
  final List<String> allSpecialties;
  final List<String> selectedSpecialties;
  final Function(String) onSpecialtyToggle;

  const CatalogSpecialtyFilter({
    super.key,
    required this.allSpecialties,
    required this.selectedSpecialties,
    required this.onSpecialtyToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // centraliza horizontalmente
        children: [
          Center(
            child: Text(
              'Especialidades:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // centraliza o texto
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: allSpecialties.map((specialty) {
              final isSelected = selectedSpecialties.contains(specialty);
              return FilterChip(
                label: Text(specialty),
                selected: isSelected,
                onSelected: (_) => onSpecialtyToggle(specialty),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
