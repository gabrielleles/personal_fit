import 'package:flutter/material.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/catalog/catalog_specialities_filter.dart';
import 'package:provider/provider.dart';
import '../providers/personal_provider.dart';
import 'widgets/catalog/catalog_search_bar.dart';
import 'widgets/catalog/catalog_personal_list.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Personais'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<PersonalProvider>(
        builder: (context, provider, _) {
          final personals = provider.filteredPersonals;
          return Column(
            children: [
              const SizedBox(height: 16),
              CatalogSearchBar(onChanged: provider.updateSearch),
          CatalogSpecialityFilter(
            allSpecialties: provider.allSpecialties,
            selectedSpecialties: provider.selectedSpecialties.toList(),  // <-- converte Set para List
            onSpecialtyToggle: provider.toggleSpecialtyFilter,
          ),
              Expanded(child: CatalogPersonalList(personals: personals)),
            ],
          );
        },
      ),
    );
  }
}