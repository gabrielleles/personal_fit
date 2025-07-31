import 'package:flutter/material.dart';
import '../../domain/entities/personal.dart';

class PersonalSimulationPage extends StatefulWidget {
  final Personal personal;

  const PersonalSimulationPage({super.key, required this.personal});

  @override
  State<PersonalSimulationPage> createState() => _PersonalSimulationPageState();
}

class _PersonalSimulationPageState extends State<PersonalSimulationPage> {
  String selectedModality = 'Musculação';
  int selectedFrequency = 1;

  final modalities = ['Musculação', 'Crossfit', 'Funcional', 'Pilates'];

  double get estimatedPrice => widget.personal.price * selectedFrequency;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Interesse Enviado'),
        content: Text(
          'Você demonstrou interesse em contratar ${widget.personal.name}. '
              'O personal entrará em contato com você em breve!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Simulação de Contratação')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal: ${widget.personal.name}',
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            Text('Escolha a modalidade', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedModality,
              items: modalities
                  .map((mod) => DropdownMenuItem(value: mod, child: Text(mod)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedModality = value!);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 24),

            Text('Frequência por semana', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              value: selectedFrequency,
              items: List.generate(
                7,
                    (i) => DropdownMenuItem(value: i + 1, child: Text('${i + 1}x / semana')),
              ),
              onChanged: (value) {
                setState(() => selectedFrequency = value!);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Valor estimado: R\$ ${estimatedPrice.toStringAsFixed(2)} / mês',
              style: theme.textTheme.titleLarge?.copyWith(color: Colors.blueAccent),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Enviar Interesse'),
                onPressed: _showConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
