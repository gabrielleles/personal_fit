import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/entities/personal.dart';
import 'personal_simulation_page.dart';

class PersonalDetailPage extends StatelessWidget {
  final Personal personal;

  const PersonalDetailPage({super.key, required this.personal});

  Future<void> _openWhatsApp(BuildContext context, String phone) async {
    final url = Uri.parse('https://wa.me/$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(personal.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(personal.photoUrl),
            ),
            const SizedBox(height: 16),
            Text(personal.name,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('${personal.city}, ${personal.state}'),
            const SizedBox(height: 8),
            Text('Especialidades: ${personal.specialties.join(', ')}'),
            const SizedBox(height: 8),
            Text('Avaliação: ⭐ ${personal.rating}'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text('Simular contratação'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          PersonalSimulationPage(personal: personal)),
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.chat),
              label: const Text('Conversar via WhatsApp'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () => _openWhatsApp(context, personal.whatsapp),
            ),
          ],
        ),
      ),
    );
  }
}
