import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/personal_model.dart';

class PersonalRemoteDatasource {
  final String baseUrl = 'http://localhost:3000';

  Future<List<PersonalModel>> getPersonals() async {
    final response = await http.get(Uri.parse('$baseUrl/personals'));

    if (response.statusCode == 200) {
      final List list = json.decode(response.body);
      return list.map((json) => PersonalModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar personais');
    }
  }
}
