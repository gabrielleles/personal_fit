import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/personal_provider.dart';
import 'personal_detail_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PersonalProvider>(context, listen: false);
      provider.fetchPersonals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Personal Trainers'),
      ),
      body: Consumer<PersonalProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Buscar por nome',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => provider.updateSearch(value),
                ),
              ),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: provider.allSpecialties.map((specialty) {
                    final isSelected =
                    provider.selectedSpecialties.contains(specialty);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(specialty),
                        selected: isSelected,
                        onSelected: (_) {
                          provider.toggleSpecialtyFilter(specialty);
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: provider.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.filteredPersonals.isEmpty
                    ? const Center(
                  child: Text('Nenhum personal encontrado'),
                )
                    : ListView.builder(
                  itemCount: provider.filteredPersonals.length,
                  itemBuilder: (context, index) {
                    final personal = provider.filteredPersonals[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PersonalDetailPage(personal: personal),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                NetworkImage(personal.photoUrl),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      personal.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(personal.rating.toString()),
                                      ],
                                    ),
                                    Text(
                                      personal.specialties.join(', '),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
