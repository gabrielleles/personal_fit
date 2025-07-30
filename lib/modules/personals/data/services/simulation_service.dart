import 'dart:convert';
import 'package:http/http.dart' as http;

class SimulationService {
  static const String baseUrl = 'http://localhost:3000';

  static Future<bool> sendSimulationInterest({
    required String personalId,
    required String modality,
    required String frequency,
    required String userName,
    required double estimatedPrice,
  }) async {
    final url = Uri.parse('$baseUrl/contact-interest');

    final body = jsonEncode({
      "personalId": personalId,
      "modality": modality,
      "frequency": frequency,
      "userName": userName,
      "estimatedPrice": estimatedPrice,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        print('Erro ao enviar simulação: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Exception ao enviar simulação: $e');
      return false;
    }
  }
}
