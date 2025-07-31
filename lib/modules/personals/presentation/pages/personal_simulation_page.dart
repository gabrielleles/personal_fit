import 'package:flutter/material.dart';
import '../../../../shared/widgets/personal_avatar.dart';
import '../../domain/entities/personal.dart';
import '../../../../core/routes.dart';


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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Interesse Enviado', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          'Você demonstrou interesse em contratar ${widget.personal.name}. '
              'O personal entrará em contato com você em breve!',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.catalog,
                    (route) => false,
              );
            },
            child: const Text('OK', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação de Contratação'),
        elevation: 4,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Aqui adicionei o PersonalAvatar logo antes do nome do personal
                PersonalAvatar(
                  photoUrl: widget.personal.photoUrl,
                  radius: 48,
                ),
                const SizedBox(height: 16),

                Text(
                  'Personal',
                  style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.personal.name,
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                Text('Escolha a modalidade', style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    value: selectedModality,
                    items: modalities
                        .map((mod) => DropdownMenuItem(value: mod, child: Text(mod)))
                        .toList(),
                    onChanged: (value) => setState(() => selectedModality = value!),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                Text('Frequência por semana', style: theme.textTheme.titleMedium, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<int>(
                    value: selectedFrequency,
                    items: List.generate(
                      7,
                          (i) => DropdownMenuItem(
                          value: i + 1, child: Text('${i + 1}x / semana')),
                    ),
                    onChanged: (value) => setState(() => selectedFrequency = value!),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      filled: true,
                      fillColor: Colors.blue.shade50,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                Text(
                  'Valor estimado',
                  style: theme.textTheme.labelMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'R\$ ${estimatedPrice.toStringAsFixed(2)} / mês',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                SizedBox(
                  width: 200,
                  height: 44,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.send, size: 18),
                    label: const Text(
                      'Enviar Interesse',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onPressed: _showConfirmationDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
