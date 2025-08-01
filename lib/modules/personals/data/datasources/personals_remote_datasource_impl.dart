import 'dart:convert';
import 'dart:io';
import 'package:personal_fit/modules/personals/data/datasources/personals_remote_datasource.dart';
import '../models/personal_model.dart';

class PersonalRemoteDatasourceImpl implements PersonalRemoteDatasource {
  @override
  Future<List<PersonalModel>> fetchPersonals() async {
    try {
      final file = File('db.json'); // Caminho relativo à raiz do projeto
      final contents = await file.readAsString();
      final data = jsonDecode(contents) as List;

      return data.map((json) => PersonalModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Erro ao buscar os dados dos personal trainers: $e');
    }
  }
  as
}
