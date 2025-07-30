import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/personal.dart';
import '../controllers/personal_controller.dart';

class PersonalListPage extends StatelessWidget {
  const PersonalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PersonalController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personais Disponíveis'),
      ),
      body: Builder(
        builder: (context) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null) {
            return Center(child: Text('Erro: ${controller.errorMessage}'));
          }

          final personals = controller.personals;

          if (personals.isEmpty) {
            return const Center(child: Text('Nenhum personal encontrado.'));
          }

          return ListView.builder(
            itemCount: personals.length,
            itemBuilder: (context, index) {
              final personal = personals[index];
              return PersonalCard(personal: personal);
            },
          );
        },
      ),
    );
  }
}

class PersonalCard extends StatelessWidget {
  final Personal personal;

  const PersonalCard({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(personal.photoUrl),
        ),
        title: Text(personal.name),
        subtitle: Text(
          '${personal.city}, ${personal.state}\nEspecialidades: ${personal.specialties.join(', ')}',
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('⭐ ${personal.rating}'),
            Text('R\$ ${personal.price.toStringAsFixed(2)}'),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Aqui futuramente vai para página de detalhes ou simulação
        },
      ),
    );
  }
}
