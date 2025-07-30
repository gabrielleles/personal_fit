class SimulationService {
  static Future<bool> sendSimulationInterest({
    required String personalId,
    required String modality,
    required String frequency,
    required String userName,
    required double estimatedPrice,
  }) async {
    // Aqui você pode implementar envio real para backend ou Firebase.
    await Future.delayed(const Duration(seconds: 1));
    print('Simulação enviada:');
    print('Personal: $personalId');
    print('Modalidade: $modality');
    print('Frequência: $frequency');
    print('Usuário: $userName');
    print('Preço estimado: $estimatedPrice');
    return true;
  }
}
