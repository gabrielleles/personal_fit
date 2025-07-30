import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../domain/entities/personal.dart';
import '../../domain/repositories/personal_repository.dart';
import '../models/personal_model.dart';

class PersonalRepositoryImpl implements PersonalRepository {
  final String baseUrl;
  final http.Client client;

  PersonalRepositoryImpl({
    this.baseUrl = 'http://localhost:3000',
    http.Client? client,
  }) : client = client ?? http.Client();

  @override
  Future<List<Personal>> getAll() async {
    final response = await client.get(Uri.parse('$baseUrl/personals'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<PersonalModel> models =
      data.map((json) => PersonalModel.fromJson(json)).toList();
      return models.map((model) => model.toEntity()).toList();
    } else {
      throw Exception('Failed to load personals');
    }
  }
}
