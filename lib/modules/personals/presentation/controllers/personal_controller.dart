import 'package:flutter/material.dart';

import '../../domain/entities/personal.dart';
import '../../domain/repositories/personal_repository.dart';



class PersonalController extends ChangeNotifier {
  final PersonalRepository repository;

  List<Personal> personals = [];
  bool isLoading = false;
  String? errorMessage; // ← Adiciona aqui o atributo que faltava

  PersonalController(this.repository);

  Future<void> loadPersonals() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      personals = await repository.getAll(); // ← método correto
    } catch (e) {
      errorMessage = 'Erro ao carregar os dados: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
