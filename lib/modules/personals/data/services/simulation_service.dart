class SimulationService {
  /// Simula o envio do interesse de contratação.
  /// Sempre retorna true após 2 segundos para simular sucesso.
  static Future<bool> sendSimulationInterest({
    required String personalId,
    required String modality,
    required String frequency,
    required String userName,
    required double estimatedPrice,
  }) async {
    // Simula uma espera que seria a chamada ao backend
    await Future.delayed(const Duration(seconds: 2));

    // Retorna sucesso (true)
    return true;
  }
}
