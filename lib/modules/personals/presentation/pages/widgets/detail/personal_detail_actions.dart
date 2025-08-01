import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/routes.dart';
import '../../../../domain/entities/personal.dart';

class PersonalDetailActions extends StatelessWidget {
  final Personal personal;

  const PersonalDetailActions({super.key, required this.personal});

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
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 220,
            child: ElevatedButton.icon(
              onPressed: () => _openWhatsApp(context),
              icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 18),
              label: const Text('Entrar em contato'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 220,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.simulation,
                  arguments: personal,
                );
              },
              child: const Text('Simular contratação'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
