import 'package:flutter/material.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/simulation/simulation_avatar_and_name.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/simulation/simulation_frequency_dropdown.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/simulation/simulation_modality_dropdown.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/simulation/simulation_price_display.dart';
import 'package:personal_fit/modules/personals/presentation/pages/widgets/simulation/simulation_send_button.dart';
import '../../../../core/routes.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 600 ? 24.0 : screenWidth * 0.2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação de Contratação'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SimulationAvatarAndName(personal: widget.personal),
                const SizedBox(height: 32),
                SimulationModalityDropdown(
                  selected: selectedModality,
                  modalities: modalities,
                  onChanged: (value) => setState(() => selectedModality = value),
                ),
                const SizedBox(height: 32),
                SimulationFrequencyDropdown(
                  selected: selectedFrequency,
                  onChanged: (value) => setState(() => selectedFrequency = value),
                ),
                const SizedBox(height: 40),
                SimulationPriceDisplay(price: estimatedPrice),
                const SizedBox(height: 48),
                SimulationSendButton(onPressed: _showConfirmationDialog),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
