import 'package:flutter/material.dart';

class CatalogSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CatalogSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400, // ajuste conforme necessário (300–500 recomendado)
        child: TextField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            labelText: 'Buscar por nome',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
