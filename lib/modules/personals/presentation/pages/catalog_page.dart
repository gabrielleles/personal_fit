import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes.dart';
import '../../presentation/providers/personal_provider.dart';
import '../../../../shared/widgets/personal_avatar.dart';  // import do PersonalAvatar

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      final provider = Provider.of<PersonalProvider>(context, listen: false);
      provider.fetchPersonals();
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Personais'),
      ),
      body: Consumer<PersonalProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final specialties = provider.allSpecialties;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de busca
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  onChanged: provider.updateSearch,
                  decoration: const InputDecoration(
                    labelText: 'Buscar por nome',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // Título das especialidades
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Especialidades:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              // Filtros por especialidade
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: specialties.length,
                  itemBuilder: (context, index) {
                    final specialty = specialties[index];
                    final isSelected = provider.selectedSpecialties.contains(specialty);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(specialty),
                        selected: isSelected,
                        onSelected: (_) => provider.toggleSpecialtyFilter(specialty),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Lista de cards
              Expanded(
                child: provider.filteredPersonals.isEmpty
                    ? const Center(child: Text('Nenhum personal encontrado.'))
                    : ListView.builder(
                  itemCount: provider.filteredPersonals.length,
                  itemBuilder: (context, index) {
                    final personal = provider.filteredPersonals[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.detail,
                            arguments: personal,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              PersonalAvatar(photoUrl: personal.photoUrl, radius: 24), // aqui o avatar
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      personal.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
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
                                      'Especialidades: ${personal.specialties.join(', ')}',
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
