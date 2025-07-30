
import 'package:flutter/material.dart';

import '../../data/services/simulation_service.dart';

Future<void> confirmarContratacao() async {
  if (!_formKey.currentState!.validate()) return;

  final payload = {
    'personalId': widget.personal.id,
    'modalidade': _selectedModalidade.toLowerCase(),
    'frequency': '${_frequenciaSemanal}x',
    'userName': _nomeController.text,
    'estimatedPrice': _precoEstimado,
    'durationMonths': _duracaoMeses,
    'objective': _objetivoController.text,
  };

  try {
    await SimulationService.sendSimulation(payload);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Simulação enviada com sucesso!')),
    );
    Navigator.pop(context);
  } catch (e) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao enviar simulação: $e')),
    );
  }
}