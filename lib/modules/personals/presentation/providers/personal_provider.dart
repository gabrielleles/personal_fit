import 'package:flutter/material.dart';
import '../../domain/entities/personal.dart';
import '../../domain/repositories/personal_repository.dart';

class PersonalProvider extends ChangeNotifier {
  final PersonalRepository repository;

  PersonalProvider({required this.repository});

  List<Personal> _personals = [];
  List<Personal> get personals => _personals;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _searchText = '';
  String get searchText => _searchText;

  Set<String> _selectedSpecialties = {};
  Set<String> get selectedSpecialties => _selectedSpecialties;

  List<String> get allSpecialties {
    final specialtiesSet = <String>{};
    for (final p in _personals) {
      specialtiesSet.addAll(p.specialties);
    }
    return specialtiesSet.toList();
  }

  List<Personal> get filteredPersonals {
    return _personals.where((p) {
      final matchesSearch = p.name.toLowerCase().contains(_searchText.toLowerCase());
      final matchesSpecialty = _selectedSpecialties.isEmpty ||
          p.specialties.any((s) => _selectedSpecialties.contains(s));
      return matchesSearch && matchesSpecialty;
    }).toList();
  }

  Future<void> fetchPersonals() async {
    _isLoading = true;
    notifyListeners();
    try {
      final fetchedPersonals = await repository.getAll();
      _personals = fetchedPersonals;
    } catch (e) {
      // tratar erro
    }
    _isLoading = false;
    notifyListeners();
  }

  void updateSearch(String text) {
    _searchText = text;
    notifyListeners();
  }

  void toggleSpecialtyFilter(String specialty) {
    if (_selectedSpecialties.contains(specialty)) {
      _selectedSpecialties.remove(specialty);
    } else {
      _selectedSpecialties.add(specialty);
    }
    notifyListeners();
  }
}

