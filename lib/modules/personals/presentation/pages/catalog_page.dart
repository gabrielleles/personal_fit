import 'package:flutter/material.dart';
import '../../data/repositories/personal_repository_impl.dart';
import '../../domain/entities/personal.dart';
import 'personal_detail_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final repository = PersonalRepositoryImpl(baseUrl: 'http://localhost:3000');

  List<Personal> allPersonals = [];
  List<Personal> filteredPersonals = [];
  List<String> allSpecialties = [];
  String selectedSpecialty = 'Todas';
  String searchName = '';

  @override
  void initState() {
    super.initState();
    _loadPersonals();
  }

  Future<void> _loadPersonals() async {
    final personals = await repository.getAll();
    setState(() {
      allPersonals = personals;

      final specialtiesSet = <String>{};
      for (var p in personals) {
        specialtiesSet.addAll(p.specialties);
      }
      allSpecialties = ['Todas', ...specialtiesSet.toList()..sort()];

      _applyFilters();
    });
  }

  void _applyFilters() {
    List<Personal> tempList = allPersonals;

    if (selectedSpecialty != 'Todas') {
      tempList = tempList.where((p) => p.specialties.contains(selectedSpecialty)).toList();
    }

    if (searchName.isNotEmpty) {
      tempList = tempList.where((p) => p.name.toLowerCase().contains(searchName.toLowerCase())).toList();
    }

    setState(() {
      filteredPersonals = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (allPersonals.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Catálogo de Personais')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Personais')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Filtrar por especialidade:',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: selectedSpecialty,
              items: allSpecialties
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedSpecialty = value;
                  _applyFilters();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                searchName = value;
                _applyFilters();
              },
            ),
          ),
          Expanded(
            child: filteredPersonals.isEmpty
                ? const Center(child: Text('Nenhum personal encontrado.'))
                : ListView.builder(
              itemCount: filteredPersonals.length,
              itemBuilder: (context, index) {
                final p = filteredPersonals[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(p.photoUrl),
                  ),
                  title: Text(p.name),
                  subtitle: Text(
                      '${p.city} - ${p.state}\nEspecialidades: ${p.specialties.join(', ')}'),
                  isThreeLine: true,
                  trailing: Text('⭐ ${p.rating}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PersonalDetailPage(personal: p),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
