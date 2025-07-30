import 'package:flutter/material.dart';
import '../../domain/entities/personal.dart';

class PersonalDetailPage extends StatelessWidget {
  const PersonalDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final personal = ModalRoute.of(context)!.settings.arguments as Personal;

    return Scaffold(
      appBar: AppBar(title: Text(personal.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(personal.photoUrl),
            ),
            const SizedBox(height: 16),
            Text(
              personal.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('${personal.city}/${personal.state}'),
            const SizedBox(height: 8),
            Text('Especialidades: ${personal.specialties.join(', ')}'),
            const SizedBox(height: 8),
            Text('Avaliação: ${personal.rating} ⭐'),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/simulate', arguments: personal);
              },
              icon: const Icon(Icons.monetization_on),
              label: const Text('Quero contratar'),
            ),
          ],
        ),
      ),
    );
  }
}
