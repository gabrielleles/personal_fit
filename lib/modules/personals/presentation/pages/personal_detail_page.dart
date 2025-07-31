import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/personal.dart';

class PersonalDetailPage extends StatelessWidget {
  final Personal personal;

  const PersonalDetailPage({Key? key, required this.personal})
      : super(key: key);

  void _openWhatsApp(BuildContext context) async {
    final uri = Uri.parse("https://wa.me/${personal.whatsapp}");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(personal.photoUrl),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                personal.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(personal.rating.toStringAsFixed(1)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              personal.bio,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 12),
            Text(
              'Especialidades: ${personal.specialties.join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Localização: ${personal.city}, ${personal.state}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Preço médio por sessão: R\$ ${personal.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _openWhatsApp(context),
              icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
              label: const Text('Entrar em contato'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/simulation',
                  arguments: personal,  // personal deve ser do tipo Personal e não nulo
                );
              },
              child: const Text('Simular contratação'),
            ),

          ],
        ),
      ),
    );
  }
}
