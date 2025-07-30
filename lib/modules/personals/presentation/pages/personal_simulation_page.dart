import 'package:flutter/material.dart';
import '../../domain/entities/personal.dart';
import '../../data/services/simulation_service.dart';

class PersonalSimulationPage extends StatefulWidget {
  final Personal personal;

  const PersonalSimulationPage({super.key, required this.personal});

  @override
  State<PersonalSimulationPage> createState() => _PersonalSimulationPageState();
}

class _PersonalSimulationPageState extends State<PersonalSimulationPage> {
  final _formKey = GlobalKey<FormState>();
  String modality = 'online';
  String frequency = '1x';

  double calculateEstimatedPrice() {
    int freqNum = int.tryParse(frequency[0]) ?? 1;
    return (widget.personal.price * freqNum).toDouble();
  }

  Future<void> _confirmHire() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final estimatedPrice = calculateEstimatedPrice();

      final success = await SimulationService.sendSimulationInterest(
        personalId: widget.personal.id,
        modality: modality,
        frequency: frequency,
        userName: 'Usuário Teste', // pode ser input do usuário
        estimatedPrice: estimatedPrice,
      );

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Interesse enviado com sucesso!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao enviar interesse.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulação de Contratação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Personal: ${widget.personal.name}', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Text('Modalidade:', style: Theme.of(context).textTheme.titleMedium),
              DropdownButton<String>(
                value: modality,
                items: const [
                  DropdownMenuItem(value: 'online', child: Text('Online')),
                  DropdownMenuItem(value: 'presencial', child: Text('Presencial')),
                ],
                onChanged: (value) {
                  setState(() {
                    modality = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Frequência:', style: Theme.of(context).textTheme.titleMedium),
              DropdownButton<String>(
                value: frequency,
                items: const [
                  DropdownMenuItem(value: '1x', child: Text('1x por semana')),
                  DropdownMenuItem(value: '2x', child: Text('2x por semana')),
                  DropdownMenuItem(value: '3x', child: Text('3x por semana')),
                ],
                onChanged: (value) {
                  setState(() {
                    frequency = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Preço estimado: R\$ ${calculateEstimatedPrice().toStringAsFixed(2)}'),
              const Spacer(),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Confirmar Contratação'),
                onPressed: _confirmHire,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
